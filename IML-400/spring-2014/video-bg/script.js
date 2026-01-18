(function(){//videobg
	if(!$("body").hasClass("home"))return;
	if(isPhone()){//don't burden mobiles with video bg
		$("#video").remove();
		return;
	}
	$("#bg").html($("#video"));//move from inside the document
	
	//stretching the video centering it where parts maybe offscreen
	$(window).on("load resize checkvideo",function(){
		$(window).trigger("videocheck");//pump all events into this one so if vid fails you can ignore all of them by unbinding it
	});
	$(window).on("videocheck",function(){
		var vid=$("video");
		if(!vid.length)return;
		var w=$(this).width();
		var h=$(this).height();
		var vw=vid.width();
		var vh=vid.height();
		//document.title="window("+w+","+h+") video("+vw+","+vh+")";
		//seems like too much screwing around. center video vertically or horizontally
		if(h>vh){//vid too short
			vid.css({"width":"auto","height":"100%"});
			console.log("video was too short, set height to 100")
			setTimeout(function(){ $(window).trigger("checkvideo"); },300);//come back later and center horizontally
			//100% height. vid width will now be too big
		}else if(vw>w){//center horizontal
			var left=(vw-w)/2;
			console.log("bumped video margin to center hz")
			vid.css("margin","auto").css("margin-left",-left+"px");
		}else if(w>vw){//vid too skinny
			vid.css("margin","auto");
			vid.css({"height":"auto","width":"100%"});
			console.log("made vid width 100%")
			setTimeout(function(){ $(window).trigger("checkvideo"); },200);//come back later and center vertically
		}else if(vh>h){//center vertical
			var top=(vh-h)/2;
			vid.css("margin","auto").css("margin-top",-top+"px");
			console.log("centered video v")
		}
	});
	$(window).on("load",function(){
		var v=document.getElementsByTagName("video")[0];
		try{
			v.play();
			$(v).css("opacity",1);
		}catch(e){
			console.log(e);
			$(window).off("videocheck");
		}
	});

})();



(function(){//make main element perfect size inside window
	var m=$("#main");
	//var mi=$(".main-inner");//just the text contents
	if(!m.length)return;
	$(window).on("load resize now", function(){
		var wh=$(window).height();
		var hh=$("#question").height();
		var targh=(wh-hh);
		m.css("height",targh);
		
		//center the text of the main area vertically
		//var ttop=wh/2 - hh - (mi.height()/2) - 30 ;//1/2 window height - 1/2 text height - header height. (20px coming from somewhere?)
		//mi.css("padding-top",ttop);
		
		//center text vertically
		//var ttop=(targh/2)-(mi.height()/2);
		//var stick=$(".stick").height() || 0;
		//ttop-=(stick/2);
		//mi.css("top",ttop);
	
	}).trigger("now");
})();





function isPhone(includeSize,size){
	if(!size)size=780;
	var ua=navigator.userAgent.toLowerCase();
	var p="ipad ipod iphone android blackberry".split(" ");
	if(includeSize && $(window).width()<size)return 1;
	for(var i=0;i<p.length;i++){
		if(ua.indexOf(p[i])>-1){	
			return 1;
		}
	}
	return 0;
}