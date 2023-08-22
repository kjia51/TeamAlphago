
    (function(){
        var $navFull = $("#navFull");
        $("#navBig").on("mouseenter", function(){
            $navFull.show();
            return false;
        }).find('a').on('click', function(){
            $navFull.show();
            return false;
        });
        $navFull.on("mouseleave", function(){
            $(this).hide();
        });

        $("#locationBtn").on("click", function(){
            $(this).next().slideToggle(300);
        });
    })();

    // footer link
    $("#footerLink").on("change", function(){
        window.open( this.value, '_blank');
    });

    (function(){
        $("select").each(function(){
            var val = this.getAttribute("value");
            if ( val )  {
                this.value = val;
            }
        });
    })();

    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
    ga('create', 'UA-93094606-1', 'auto');
    ga('send', 'pageview');
