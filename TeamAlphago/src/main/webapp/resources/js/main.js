 var $rankingWrap = $('#rankingWrap');
    $('#rankingTab > a').on({
        'mouseenter': function(){
            var $target = $rankingWrap.children('.' + this.getAttribute('href'));
                $target.show().siblings().hide();
            $(this).addClass('current')
                .siblings().removeClass('current');
        },
        'click': function(){
            $rankingWrap.children('ul').each(function(){
                $(this).children().eq(2).nextAll().toggle();
            });
            return false;
        }
    });

    /**
     * 메인페이지 비디오
     */
    (function(){
        var $closeBtn = $('#evePopVideoCloseBtn'),
            date      = new Date(),
            today     = date.getFullYear().toString() + (date.getMonth()+1).toString() + date.getDate().toString();

        if (localStorage.getItem('mVideo') != today) {
            $('#eveMVideo').show();
        }
        $closeBtn.on('click', function(){
            $(this).parents('.mvideo').remove();
        });
        $('#evePopVideoTodayCloseBtn').on('click', function () {
            localStorage.setItem('mVideo', today);
            $closeBtn.trigger('click');
        });
    })();

    (function(){
        var $closeBtn = $('#evePopupCloseBtn'),
            date      = new Date(),
            today     = date.getFullYear().toString() + (date.getMonth()+1).toString() + date.getDate().toString();

        if (localStorage.getItem('mPopup') != today) {
            $('#evePopup').show();
        }
        $closeBtn.on('click', function(){
            $(this).parents('.mpopup').remove();
        });
        $('#evePopupTodayCloseBtn').on('click', function () {
            localStorage.setItem('mPopup', today);
            $closeBtn.trigger('click');
        });
    })();

    (function(){
        var $closeBtn = $('#evePopupCloseBtn2'),
            date      = new Date(),
            today     = date.getFullYear().toString() + (date.getMonth()+1).toString() + date.getDate().toString();

        if (localStorage.getItem('mPopup2') != today) {
            $('#evePopup2').show();
        }
        $closeBtn.on('click', function(){
            $(this).parents('.mpopup2').remove();
        });
        $('#evePopupTodayCloseBtn2').on('click', function () {
            localStorage.setItem('mPopup2', today);
            $closeBtn.trigger('click');
        });
    })();

    (function(){
        var $closeBtn = $('#evePopupCloseBtn3'),
            date      = new Date(),
            today     = date.getFullYear().toString() + (date.getMonth()+1).toString() + date.getDate().toString();

        if (localStorage.getItem('mpopup3') != today) {
            $('#evePopup3').show();
        }
        $closeBtn.on('click', function(){
            $(this).parents('.mpopup3').remove();
        });
        $('#evePopupTodayCloseBtn3').on('click', function () {
            localStorage.setItem('mpopup3', today);
            $closeBtn.trigger('click');
        });
    })();

    (function(){
        var $closeBtn = $('#evePopupCloseBtn4'),
            date      = new Date(),
            today     = date.getFullYear().toString() + (date.getMonth()+1).toString() + date.getDate().toString();

        if (localStorage.getItem('mpopup4') != today) {
            $('#evePopup4').show();
        }
        $closeBtn.on('click', function(){
            $(this).parents('.mpopup4').remove();
        });
        $('#evePopupTodayCloseBtn4').on('click', function () {
            localStorage.setItem('mpopup4', today);
            $closeBtn.trigger('click');
        });
    })();


    (function(){
        var $sponsorLayout = $('#eve_sponsor_layout') ,
            $sponsorTitle = $('#eve_sponsorTitle') ,
            $sponsorOrder = $('#eve_sponsor_order') ,
            $sponsorNextBtn = $('#eve_sponsorBtn_next') ,
            sponsorLen = $sponsorLayout.children().length ,
            order = 1 ,
            orderRoll = function( $num ) {
                order += $num;
                if ( order > sponsorLen ){
                    order = 1;
                }
                if ( order < 1 ){
                    order = sponsorLen;
                }
                $sponsorOrder.text(order+'/'+sponsorLen);
            };

        $sponsorOrder.text('1/'+sponsorLen);
        $sponsorNextBtn.on('click', function(){
            $sponsorLayout.children().first().hide().appendTo( $sponsorLayout );
            var name = $sponsorLayout.children().first().fadeIn()[0].getAttribute('data-name');
            $sponsorTitle.text(name);
            orderRoll(+1);
        });
        $('#eve_sponsorBtn_prev').on('click', function(){
            $sponsorLayout.children().first().hide();
            var name = $sponsorLayout.children().last().fadeIn().prependTo( $sponsorLayout )[0].getAttribute('data-name');
            $sponsorTitle.text(name);
            orderRoll(-1);
        });
        setInterval(function(){
            $sponsorNextBtn.trigger('click');
        }, 6000);

 
    })();
