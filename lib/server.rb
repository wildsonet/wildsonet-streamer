module WildSoNet
  module Streamer

    java_import "org.jboss.netty.channel.socket.nio.NioServerSocketChannelFactory"
    java_import "org.jboss.netty.bootstrap.ServerBootstrap"

    java_import "org.jboss.netty.channel.Channels"
    java_import "org.jboss.netty.channel.ChannelPipelineFactory"
    java_import "org.jboss.netty.handler.codec.string.StringDecoder"
    java_import "org.jboss.netty.handler.codec.string.StringEncoder"
    java_import "org.jboss.netty.handler.codec.frame.Delimiters"
    java_import "org.jboss.netty.handler.codec.frame.DelimiterBasedFrameDecoder"

    java_import "org.jboss.netty.channel.SimpleChannelUpstreamHandler"

    java_import "java.util.concurrent.Executors"
    java_import "java.net.InetSocketAddress"

    class Server

      def initialize port, address, encoder
        @factory   = NioServerSocketChannelFactory.new(Executors.newCachedThreadPool(), Executors.newCachedThreadPool())
        @bootstrap = ServerBootstrap.new(@factory)
        @bootstrap.setPipelineFactory(PipelineFactory.new(encoder))
        @bootstrap.bind(InetSocketAddress.new(address, port))
      end

      def self.start(port, address = "0.0.0.0", encoder=WildSoNet::Streamer::Encoder)
        @@servers ||= {}
        @@servers["#{address}:#{port}"] = Server.new(port, address, encoder)
        @@connections                   = {}
        @@receiver = Receiver.new
      end

      def self.push(cid, message)

        @@connections[cid.to_s].each do |con|
          con.write(message)
        end if @@connections[cid.to_s]

      end

      def self.register(cid, connection)
        @@connections[cid.to_s] ||= []
        @@connections[cid.to_s] << connection
      end

      def self.unregister(cid, connection)
        return if not @@connections[cid.to_s]
        @@connections[cid.to_s].delete(connection)
      end

    end

    class Receiver
      def initialize
        @thread = Thread.new do
          while true
            msg = WildSoNet::Hazelcast.queue("streamer").take()
            msg = Marshal.load(msg)
            WildSoNet::Streamer::Server.push(msg[0], msg[1])
          end
        end
      end
    end

    class PipelineFactory

      include ChannelPipelineFactory

      def initialize encoder
        @encoder = encoder
      end

      def getPipeline

        pip = Channels.pipeline

        pip.addLast("framer", DelimiterBasedFrameDecoder.new(8192, Delimiters.lineDelimiter()))

        pip.addLast("decoder", StringDecoder.new)
        pip.addLast("encoder", StringEncoder.new)

        handler = Handler.new
        handler.encoder = @encoder

        pip.addLast("handler", handler)

        pip

      end

    end
  end
end