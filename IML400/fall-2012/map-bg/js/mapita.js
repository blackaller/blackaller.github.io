<!--
// jQuery.noConflict();
// RUN

$(window).load(
    function() {

		/* Lazy Load*/
		$("img").lazyload({ 
		    effect : "fadeIn",
		    placeholder : "images/ojo.jpg",
		});
		
	}
);

//-->
var map = false;

var y = 0;
var i = 0;

var longitude = new Array();
var latitude = new Array();
var zoom = new Array();
var place = new Array();


//Mexico City
place[0] = "Mexico City";
longitude[0] = 19.35031;
latitude[0] =  -99.17922;
zoom[0] = 18;


//Swiss Alps
place[1] = "Swiss Alps";
longitude[1] = 46.655647;
latitude[1] = 8.336563;
zoom[1] = 14;


//Sahara
place[2] = "Sahara";
longitude[2] = 24.866503;
latitude[2] = 4.993286;
zoom[2] = 12;

//Dubai
place[3] = "Dubai";
longitude[3] = 25.281198;
latitude[3] = 55.316076;
zoom[3] = 16;

/*
//Sahara
longitude[2] = 25.451955;
latitude[2] = 5.710831;
zoom[2] = 12;


//Sahara
longitude[4] = -19.660915;
latitude[4] = -66.945835;
zoom[4] = 14;
*/

//Los Angeles
place[4] = "Los Angeles";
longitude[4] = 33.87258;
latitude[4] = -118.288031;
zoom[4] = 17;

//Tokyo
place[5] = "Tokyo";
longitude[5] = 35.677806;
latitude[5] = 139.712931;
zoom[5] = 17;

//London
place[6] = "London";
longitude[6] = 51.502999;
latitude[6] = -0.123446;
zoom[6] = 16;

//Sao Paulo
place[7] = "Sao Paulo";
longitude[7] = -23.660749;
latitude[7] = -46.536015;
zoom[7] = 17;

//Cambridge
place[8] = "Cambridge MA";
longitude[8] = 42.3877;
latitude[8] = -71.1194;
zoom[8] = 18;

//Cardiff
place[9] = "Cardiff";
longitude[9] = 51.47772;
latitude[9] = -3.17687;
zoom[9] = 18;

//Oaxaca
place[10] = "Oaxaca";
longitude[10] = 17.06677;
latitude[10] = -96.72305;
zoom[10] = 18;

//IML
place[11] = "USC IML";
longitude[11] = 34.02963;
latitude[11] = -118.27994;
zoom[11] = 18;



/*
//Hawaii
longitude[5] = 19.60746;
latitude[5] = -155.431309;
zoom[5] = 14;
*/

/*


//Los Angeles
longitude[2] = 33.87258;
latitude[2] = -118.288031;
zoom[2] = 17;

//Tokyo
longitude[1] = 35.677806;
latitude[1] = 139.712931;
zoom[1] = 17;



//Los Angeles
longitude[3] = 33.87258;
latitude[3] = -118.288031;
zoom[3] = 17;

//New York
//longitude[3] = 40.707043;
//latitude[3] = -74.017206;
//zoom[3] = 16;

//Shanghai
longitude[4] = 31.245563;
latitude[4] = 121.496498;
zoom[4] = 16;

//London
longitude[5] = 51.502999;
latitude[5] = -0.123446;
zoom[5] = 16;



//Chicago
longitude[7] = 41.885825;
latitude[7] = -87.637618;
zoom[7] = 17;

//Sao Paolo
longitude[8] = -23.660749;
latitude[8] = -46.536015;
zoom[8] = 17;

*/


function poll(){
	if (map) {
		var dy;
		if ( zoom[i] == 12 ) dy = 5000;
		else if ( zoom[i] == 14 ) dy = 15000;
		else dy = 70000;
		y -= 1 / (zoom[i] * dy);
		map.panTo(new GLatLng(longitude[i]+y,latitude[i]), zoom[i]);
	}
}

function setplace (new_i) {
	if (new_i == -1) i = Math.floor( Math.random() * longitude.length);
	else i = new_i;
	y = 0;
	map.setCenter(new GLatLng(longitude[i],latitude[i]), zoom[i]);
	$("#map-location").append(" " + place[i]);	
}


// google maps load
function load() {

	if (GBrowserIsCompatible()) {

		document.getElementById("map").style.height = document.getElementById("wrapper").offsetHeight + "px";

		var mapOptions = {}
		map = new GMap2(document.getElementById("map"));

		setplace(-1);
		map.setCenter(new GLatLng(longitude[i],latitude[i]), zoom[i]);
		
		map.setMapType(G_SATELLITE_MAP );

	}
}

setInterval("poll()",2);

