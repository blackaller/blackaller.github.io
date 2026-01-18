var tube = {
	antwoord: {
		videoId: '8Uee_mcxvrw',
		start: 42,
		ratio: 16/9,
		playButtonClass: 'tubular-play',
		pauseButtonClass: 'tubular-pause'
	},
	slotcar: {
		videoId: 'ye_WPPgIS4Q',
		start: 12,
		ratio: 16/9,
		playButtonClass: 'tubular-play',
		pauseButtonClass: 'tubular-pause'
	},
	firebaby: {
		videoId: 'HcXNPI-IPPM',
		start: 140,
		ratio: 16/9,
		playButtonClass: 'tubular-play',
		pauseButtonClass: 'tubular-pause'
	}
};

/*	Static Backgrounds  */

var bgImages = {
	ball: {
		name: 'ball.jpg',
		url: 'img/load/ball.jpg'
	},
	dream: {
		name: 'dream.jpg',
		url: 'img/load/dream.jpg'
	},
	famous: {
		name: 'famous.jpg',
		url: 'img/load/famous.jpg'
	},
	friendship: {
		name: 'friendship.jpg',
		url: 'img/load/friendship.jpg'
	},
	hero: {
		name: 'hero.jpg',
		url: 'img/load/hero.jpg'
	},
	history: {
		name: 'history.jpg',
		url: 'img/load/history.jpg'
	},
	lookit: {
		name: 'lookit.jpg',
		url: 'img/load/lookit.jpg'
	},
	party: {
		name: 'party.jpg',
		url: 'img/load/party.jpg'
	},
	princess: {
		name: 'princess.jpg',
		url: 'img/load/princess.jpg'
	},
	quest: {
		name: 'quest.jpg',
		url: 'img/load/quest.jpg'
	}

};

/*	COLOR PALETTE  */

var tubeColors = {
	lemon: {
		name: 'lemon-tube',
		rgb: [200,255,35],
		hex: '#ccff00'
	},
	lime: {
		name: 'lime-tube',
		rgb: [140,255,75],
		hex: '#99ff33'
	},
	aqua: {
		name: 'aqua-tube',
		rgb: [0,205,205],
		hex: '#00cccc'
	},
	sky: {
		name: 'sky-tube',
		rgb: [0,140,255],
		hex: '#008cff'
	},
	gum: {
		name: 'gum-tube',
		rgb: [255,0,100],
		hex: '#ff0065'
	},
	flesh: {
		name: 'flesh-tube',
		rgb: [255,65,65],
		hex: '#ff4141'
	},
	grape: {
		name: 'grape-tube',
		rgb: [120,0,205],
		hex: '#7700cc'
	},
	wine: {
		wine: 'wine-tube',
		rgb: [155,0,85],
		hex: '#550099'
	}
}

function centerParagraph(container){
	
}

function shuffle(array) {
  var currentIndex = array.length
    , temporaryValue
    , randomIndex
    ;

  // While there remain elements to shuffle...
  while (0 !== currentIndex) {

    // Pick a remaining element...
    randomIndex = Math.floor(Math.random() * currentIndex);
    currentIndex -= 1;

    // And swap it with the current element.
    temporaryValue = array[currentIndex];
    array[currentIndex] = array[randomIndex];
    array[randomIndex] = temporaryValue;
  }

  return array;
}


function randomItem(myItems){
	var getKeys = {}; 
	getKeys = Object.keys(myItems);
	return myItems[ getKeys[ Math.floor(Math.random()*getKeys.length) ] ];
}

function randomPalette(){
	var getColor = {};
	getColor= randomItem(tubeColors);

	var colorClass = "." + getColor.name;
	var rgbString = getColor.rgb[0]+", "+getColor.rgb[1]+", "+getColor.rgb[2];

	function rgbaString(rgbString, alpha){
		return 'rgba(' + rgbString + ', ' + alpha + ')'; 
	};

	var hexString =	getColor.hex;
	var overlayString = '-webkit-gradient(linear, left top, left bottom, color-stop(0%,' +
		rgbaString(rgbString, '0.4') + '), color-stop(15%,' +
		rgbaString(rgbString, '0.25') + '), color-stop(100%,' +
		rgbaString(rgbString, '0.15') + '))';

	$('body').addClass(colorClass);
	$('.link-category').css('color', rgbaString(rgbString, '1.0'));
	$('#video-overlay').css('background', overlayString);
	$('.quote').css('background', rgbaString(rgbString, '1'));
	$('.tube-color').css('fill', rgbaString(rgbString, '1'));

	$('#top-bar').hover(function(){
	    this.style.background = rgbaString(rgbString, '1.0');
	}, function() {
	    this.style.background = "none";
	});

	/*
	$('style').append(
		colorClass + ' path{ fill:'+ hexString +'; }\n' + 
		colorClass + ' .tube-color{ fill:'+ hexString +'; }\n' + 
		colorClass + ' .link-category{ color:'+ hexString +'; }\n' + 
		colorClass + ' .quote{ background:'+ hexString +'; }'
	);
	*/
}

function randomBg(){
	var getBg = {};
	getBg = randomItem(bgImages);
	return getBg;
}

function randomTube(myTubes){
	var tubeKeys = {}; 
	tubeKeys = Object.keys(myTubes);
	return myTubes[ tubeKeys[ Math.floor(Math.random()*tubeKeys.length) ] ];
}
