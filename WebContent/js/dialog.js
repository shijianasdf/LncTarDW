function waiting(){
	$.Dialog();
};

function showOverlap(content,flag){
	$.DialogOverlap(content,flag);
}
(function($) {
  $.Dialog = function() {
    var markup0=[
'<style type="text/css">',
'.dialog {',	
'	width: 240px;',
'	height:80px;',
'	padding: 20px;',
'	background: #FFF;',
'	border: 1px solid #DDD;',
'	position: fixed;',
'	top: 200px;',
'	left: 40%;',
'	z-index: 2000;',
'	background-size: auto, cover;',
'	}',
'.dialogOverlay {',
'	  width: 100%;',
'	  height: 100%;',
'	  position: fixed;',
'	  top: 0;',
'	  left: 0;',
'	  background-color: rgba(0,0,0,0.3);',
'	  z-index: 1002;',
'	}',
'</style>',
].join('');
//arrayObject.join(separator):join() 方法用于把数组中的所有元素放入一个字符串。元素是通过指定的分隔符进行分隔的。
    var markup = [
            '<div class="dialogOverlay" id="dialogOverlay">',
            '<div id="dialogBox" class="dialog radius shadow">',
            '<br> Computing..<br>please wait a few seconds! ',
            '</div></div>'
        ].join('');
    	/*
    	 *appendTo()在被选元素的结尾（仍然在内部）插入指定内容。
    	 * fadeIn() 方法使用淡入效果来显示被选元素，假如该元素是隐藏的。
    	 */
        $(markup0).hide().appendTo('body').fadeIn();
        $(markup).hide().appendTo('body').fadeIn();
 };
    
$.DialogOverlap = function(content,flag) {
        if(!$.Dialog.opened) {
            $.Dialog.opened = true;
        } else {
            return false;
        }
    
        var markup0=[
    '<style type="text/css">',
    '.dialog {',	
    '	width: 500px;',
    '	height:500px;',
    '	padding: 20px;',
    '	background: #FFF;',
    '	border: 1px solid #DDD;',
    '	position: fixed;',
    '	overflow-y:auto;',
    '	top: 17%;',
    '	left: 40%;',
    '	z-index: 2000;',
    'border-radius: 8px 0px 0px 8px;',
    '-moz-box-shadow: 0 0 5px #888;',
    '-webkit-box-shadow: 0 0 5px #888;',
    '	}',
    '.dialogOverlay {',
    '	  width: 100%;',
    '	  height: 100%;',
    '	  position: fixed;',
    '	  top: 0;',
    '	  left: 0;',
    '	  background-color: rgba(0,0,0,0.3);',
    '	  z-index: 1002;',
    '	}',
    '</style>',
    ].join('');
        var markup;
        if(flag=='heatmap'){
             markup = [
                          '<div class="dialogOverlay" id="dialogOverlay">',
                          '<div id="dialogBox" class="dialog" >',                
                          '<div id="containerOverlay" style="height: 440px; min-width: 300px; max-width: 460px; margin: 0 auto" ></div>',
                          '<p>'+content+'</p>',
                          '</div></div>'
             ].join('');        	
        }else{
        	  markup = [
                            '<div class="dialogOverlay" id="dialogOverlay">',
                            '<div id="dialogBox" class="dialog" >',                
                             '<p>'+content+'</p>',
                            '</div></div>'
               ].join('');
        	       	
        }
        

            $(markup0).hide().appendTo('body').fadeIn();
            $(markup).hide().appendTo('body').fadeIn();
            $('#dialogOverlay').click(function() { 
                $.Dialog.close();
                return false;
            });
            
    };  
    
    $.Dialog.close = function() {
        if(!$.Dialog.opened) {
            return false;
        }
        //弹出窗口关闭；
        $('#dialogOverlay').fadeOut(function() {
            $.Dialog.opened = false;
            $(this).remove();
        });
    };
 
    
})(jQuery);
