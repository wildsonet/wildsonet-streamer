var Streamer = {

    frame : null,
    url: "/streamer",

    handle : function(message) {
        alert(message);
    },

    start : function(id) {
        $(document).ready(function() {

            if($.browser.msie){
                Streamer.msie(id);
            }
            
            if($.browser.mozilla){
                Streamer.mozilla(id);
            }

            if($.browser.webkit){
                Streamer.webkit(id);
            }

            if($.browser.opera){
                Streamer.opera(id);
            }

        });
    },

    msie: function(id) {
        var url = Streamer.url + "/script/" + id;
        Streamer.frame = $("<iframe />").attr("id", "stream").css("display", "none").attr("src", url);
        Streamer.frame.load(function() {
            this.src = this.src;
        });
        $("body").append(Streamer.frame);
    },

    mozilla: function(id) {
        Streamer.ajax(id);
    },

    webkit: function(id) {
        Streamer.ajax(id);
    },

    opera: function(id) {
        Streamer.ajax(id);
    },

    ajax : function(id){
        var url = Streamer.url + "/message/" + id;
        $.ajax({
            url: url,
            success: function(data, type){
                if(data != ""){
                    Streamer.handle(data);
                }
                Streamer.ajax(id);
            }
        });
    }

}