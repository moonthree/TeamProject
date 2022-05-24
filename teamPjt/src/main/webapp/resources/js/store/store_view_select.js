/**
 * 
 */
 
 // select_container 클릭 시 open
    $('.select_menu_container').on('click touch', function(e) {
        var self = $(this);
        self.toggleClass('open');
        
		$('.arrow').toggleClass("active");
    });
	
    // 닫기 (open 제거)
    $(document).on('click touch', function(e) {
        var select_container = $('.select_container');
        if(select_container !== e.target && !select_container.has(e.target).length) {
            select_container.removeClass('open');
        }
    });

    // 상품 선택 시 li > selected
    $(document).on('click touch', '.select_menu_container ul li', function(e) {
        e.preventDefault();
        var select_menu_container = $(this).parent().parent().parent().parent();

        var active = $(this).hasClass('active');
        
        // label : 선택된 제목
        var label = active ? select_menu_container.find('.active').children().children().first().next().text() : $(this).children().children().first().next().text();
        document.getElementById('select_menu_title').innerHTML = label;
        

        select_menu_container.find('ul li').removeClass('active');

        select_menu_container.toggleClass('filled', !active);

        if(!active) {
            $(this).addClass('active');
            $(this).addClass('selected');
        }

        select_menu_container.removeClass('open');
    });

    $(".selected_container").hide();
    $(".selected_price_container").hide();

    $(document).on('click touch', '.select_menu_container ul li', function(e) {
        var select_menu_container = $(this).parent().parent().parent().parent();
        var select = select_menu_container.find('.selected');
        var value = $(this).children().children().first().val();

        // show
        $('.info'+value).show();
        $(".selected_price_container").show();
        if($('.info'+value).hasClass('show') == true){
            alert('이미 선택된 상품입니다.')
        }else{
            $('.info'+value).addClass('show');
        }

    });

    // x 버튼 클릭 시
    $(document).on('click touch', '.selected_info_container .cancelbtn', function(e) {
        var selected_container = $(this).parent().parent();
        selected_container.removeClass('show');
        selected_container.hide();

        // selected 제거
        var value = $(this).parent().prev().val();
        var menu = $('.menu'+value);
        menu.removeClass('selected');

        var select_menu_container = $(this).parent().parent().parent().prev();
        var li = select_menu_container.children().children().next().children().children();
        if(!li.hasClass('selected')){
            $(".selected_price_container").hide();
        }
        
        // value 1로 변경
        $('#p_num'+value).val(1);
        $('#p_num'+value).attr('value',1);
        // sum 변경
        var price = $('#price'+value).val();
        price = price.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        $('#sum'+value).text(price+"원");
    });