module WildSoNet
  module Streamer

    java_import "org.jboss.netty.channel.SimpleChannelUpstreamHandler"
    java_import "org.jboss.netty.channel.ChannelFutureListener"
    
    class Handler < SimpleChannelUpstreamHandler

      attr_accessor :encoder
      
      def messageReceived context, event

        message = event.getMessage

        if result = /^GET \/streamer\/([a-z]+)\/(.+) HTTP\/1\..$/.match(message)
          connection = Connection.new(context, @encoder)
          connection.type = result[1]
          connection.id = result[2]
          context.attachment = connection
        end

        if message == ""
          context.channel.write("HTTP/1.1 200 OK\r\n")
          context.channel.write("Content-Type: text/html; charset=UTF-8\r\n")
          context.channel.write("\r\n")
          WildSoNet::Streamer::Server.register(context.attachment.id, context.attachment)
        end

      end

      def channelClosed context, event
        WildSoNet::Streamer::Server.unregister(context.attachment.id, context.attachment)
      end
      
    end

    class Connection

      include ChannelFutureListener

      attr_accessor :id
      attr_accessor :type
      attr_reader :context

      def initialize context, encoder
        @context = context
        @encoder = encoder
      end

      def write data
        case @type
          when "message"
            data = @encoder.message(data)
            @context.channel.write(data).addListener(self)
          when "script"
            data = @encoder.script(data)
            @context.channel.write(data)
        end
      end

      def operationComplete future
        future.channel.close if future.isDone()
      end

    end

    class Encoder
      def self.script data
        "<script type=\"text/javascript\">parent.Streamer.handle(\"#{data}\");</script>"
      end
      def self.message data
        data
      end
    end

  end
end