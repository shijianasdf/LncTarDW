$(function() {
    
    $(window).scroll(function(){
        if ($(window).scrollTop() >= $('header').height()-55) {
            $("header > .navigation-bar").css({'position': 'fixed', 'top':'-86px'});  
        }else {
            $("header > .navigation-bar").css({'position': 'fixed','top':'0'});             
        }		    	      
    });
    
	$('.dropdown').hover(		
			function () {			
				$('.dropdown li a.parent').addClass('hover');				
				$('.dropdown ul.children').show();				
			},		
			function () {
				$('.dropdown li a.parent').removeClass('hover');		
				$('.dropdown ul.children').hide();				
			}		
	);
	$('.dropdown2').hover(		
			function () {			
				$('.dropdown2 li a.parent').addClass('hover');				
				$('.dropdown2 ul.children').show();				
			},		
			function () {
				$('.dropdown2 li a.parent').removeClass('hover');		
				$('.dropdown2 ul.children').hide();				
			}		
	);
	$('.dropdown3').hover(		
			function () {			
				$('.dropdown3 li a.parent').addClass('hover');				
				$('.dropdown3 ul.children').show();				
			},		
			function () {
				$('.dropdown3 li a.parent').removeClass('hover');		
				$('.dropdown3 ul.children').hide();				
			}		
	); 
	
	
});

function changeShow(did){
	var list=['nav-fragment-1','nav-fragment-2','nav-fragment-3','nav-fragment-4'];
	var listDiv=['fragment-1','fragment-2','fragment-3','fragment-4'];
	for(var i=0;i<list.length;i++){
		var lisob=document.getElementById(list[i]);
		var lisdi=document.getElementById(listDiv[i]);
		if(did.id==list[i]){
			lisob.className=lisob.className.replace(/ui-state-default/,'ui-state-active');
			lisdi.className=lisdi.className.replace(/ui-tabs-hide/,'ui-tabs-show');
		}else{
			lisob.className=lisob.className.replace(/ui-state-active/,'ui-state-default');
			lisdi.className=lisdi.className.replace(/ui-tabs-show/,'ui-tabs-hide');
		}
	}
}