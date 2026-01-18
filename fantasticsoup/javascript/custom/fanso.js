var indices = new Array();
indices[0]="home";
indices[1]="team";
indices[2]="work";
indices[3]="downloads";

var personas = new Array();
personas[0]="fanso";
personas[1]="blk";
personas[2]="luisa";
personas[3]="liz";
personas[4]="max";
personas[5]="nicole";

var movies = new Array();
movies[0]="mov-1";
movies[1]="mov-2";
movies[2]="mov-3";
movies[3]="mov-4";

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

function toggleFadePerson(x) {
	var options = {duration: 0.5}
	if($(x).style.display == "none") {
		Effect.Appear(x, options);  return false;
	}else{
		//Effect.Fade(x, options);
		Effect.Pulsate(x, { pulses: 2, duration: 0.6});
		return false;
	}
}

function closeOtherPerson(x){
	var options = {duration: 0.5}
	for (y in personas){
		if( ( $(personas[y]).style.display != "none" ) && ($(personas[y]).id != x) ){
			//Effect.SlideUp(indices[y], options);
			Effect.Fade(personas[y], options);
		}
		
	}
}

function toggleFadeMov(x) {
	var options = {duration: 0.5}
	if($(x).style.display == "none") {
		Effect.Appear(x, options);  return false;
	}else{
		//Effect.Fade(x, options);
		Effect.Pulsate(x, { pulses: 2, duration: 0.6});
		return false;
	}
}

function closeOtherMov(x){
	var options = {duration: 0.5}
	for (y in movies){
		if( ( $(movies[y]).style.display != "none" ) && ($(movies[y]).id != x) ){
			//Effect.SlideUp(indices[y], options);
			Effect.Fade(movies[y], options);
		}
		
	}
}