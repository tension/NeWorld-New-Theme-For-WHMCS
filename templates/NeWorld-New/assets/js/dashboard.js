$(function () {
    "use strict";
    handlePackageSwitcher();
	
    //Clipboard
    var clipboard = new Clipboard('.input-copy .btn');
    clipboard.on('success', function (e) {
        $('.input-copy .btn span').addClass('not-visible');
        $('.input-copy .check-animate').removeClass('hidden');
        e.clearSelection();
    });
    
    $('.panel-sidebar .list-group').show();
    $('.panel-sidebar .panel-body').show();

	$('select.form-control').select2({
        width: '100%',
        minimumResultsForSearch: Infinity // disable search
    });
    
    // BootStrap Modal
    $('body').append($('#modalAjax'));
    
    $('.cards-carousel').each(function () {
        var
            $this = $(this)
            , $cards = $this.find('.cards');
        var slider = $cards.lightSlider({
            item: 1
            , loop: false
            , slideMove: 1
            , slideMargin: 0
            , easing: 'cubic-bezier(0.25, 0, 0.25, 1)'
            , speed: 600
            , onBeforeSlide: function (el) {
                var
                    current = (el.getCurrentSlideCount() + slider.find('.clone').length / 2)
                    , pageCurrent = (current - 1) * 4 + $cards.find('> li:nth-child(' + current + ') > a').length;
                $this.find('.number-current').html(pageCurrent);
            }
        });
        $this.find('.card-prev').click(function () {
            slider.goToPrevSlide();
        });
        $this.find('.card-next').click(function () {
            slider.goToNextSlide();
        });
    });
});

var handlePackageSwitcher = function() {
    "use strict";
    var switcher = jQuery('.packages-switcher');
    switcher.on('click', function() {
        if (jQuery(this).hasClass('monthly')) {
            jQuery(this).removeClass('monthly');
            jQuery('.package').each(function() {
                jQuery(this).find('.package-price > span').html($(this).find('.package-price').data('year'));
            });
        } else {
            jQuery(this).addClass('monthly');
            jQuery('.package').each(function() {
                jQuery(this).find('.package-price > span').html($(this).find('.package-price').data('monthly'));
            });
        }
    });
};