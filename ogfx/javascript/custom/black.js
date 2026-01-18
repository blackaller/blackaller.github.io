var indices = new Array();
indices[0]="ogfx";
indices[1]="download";
indices[2]="demo";
indices[3]="featured";
indices[4]="api";
indices[5]="tutorial";
indices[6]="book";

function toggleSlide(x) {
	var options = {duration: 0.5}
	if($(x).style.display == "none") {
		Effect.SlideDown(x, options);  return false;
	}else{
		Effect.SlideUp(x, options); return false;
	}
}

function toggleBlind(x) {
	var options = {duration: 1.0}
	if($(x).style.display == "none") {
		Effect.BlindDown(x, options);  return false;
	}else{
		Effect.BlindUp(x, options); return false;
	}
}

function toggleFade(x) {
	var options = {duration: 0.5}
	if($(x).style.display == "none") {
		Effect.Appear(x, options);  return false;
	}else{
		//Effect.Fade(x, options);
		Effect.Pulsate(x, { pulses: 2, duration: 0.6});
		return false;
	}
}

function closeOther(x){
	var options = {duration: 0.5}
	for (y in indices){
		if( ( $(indices[y]).style.display != "none" ) && ($(indices[y]).id != x) ){
			//Effect.SlideUp(indices[y], options);
			Effect.Fade(indices[y], options);
		}
		
	}
}