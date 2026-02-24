(function(){
//-------------------------- los esticki menus
	if(!$(".stick").length)return;
	$(function(){

		var el=$(".stick");
		var above=$(".tapa");
		var top = $(el).offset().top;
		$(above).css("height", $( window ).height() - $(el).height());
		$(window).on("load resize orientationchange",function(){
			top = $(el).offset().top;//this pos may change
			$(above).css("height", $( window ).height() - $(el).height());
			//console.log($(".main").css("height"));
		});
		$(window).on("load scroll resize orientationchange", function(){
			var stop=$(window).scrollTop();
			if(stop>top){
				el.addClass("stuck");
			}else{
				el.removeClass("stuck");
			}
		});
	});

})();

//-------------------------- smooth scrolling of anchor elements
$("a[href*=#]").click(function(e){
	var hsh=$(this).attr("href");
	var el=$(hsh.substring(hsh.indexOf("#"))); //-------------assume anchor is a real obj on page
	if(!el.length)return true;
	e.preventDefault();
	var t=el.offset().top;
	var s=$(".stick");
	if(s.length){ //------------- bump below the submenu a bit more
		t-=s.height()+20;
	}
	$("html,body").animate({
		scrollTop:t
	})
	return false;
});

//-------------------------- los popups
var personajes = {
	'cabrero': {
			'titulo': '-Lo del cabrero-',
			'testimonio':
				'Baja un cabrero el monte con sus cabras. Tiene prisa, quiere ver al hombre que salió del mar junto al albergue de la peña. Aseguran que cayó del cielo, le dijo un mensajero que pasaba. Al cabrero lo acompañan sus dos hijas, la mayor muchacha en flor de carne firme, tentación de jóvenes cabreros, carga un saco de cuero con leche. La menor, todavía niña, lleva un bulto de cecina. Detrás una vieja sanadora, bastón de caña y paso trope, reparte maldiciones al perro pastor que acarrea el ganado: cuatro cabras, dos cabrones y un puñado de cabritos. Arriba en el camino el polvo, las piedras, los árboles pelones, acentos de nieve seca y el pastizal, que ondulante dora las faldas de la sierra, dentadura inmortal que invita el devenir de la noche.' + 
				'<br /><br />' + 
				'Debe haber sido un condor que volaba entre las nubes, un zopilote que flotaba frente al sol, un objeto volador no identificado. Los hombres no caen del cielo. El cabrero repite las palabras del sabio de la sierra: si no lo has visto no lo creas.' + 
				'<br /><br />' + 
				'Guardan a los animales y se meten al albergue. Junto al fuego descansa en silencio el hombre que apareció entre las olas, elegante, delicado, como de otro universo. De sus ojos escapa una curiosidad infatigable que acaricia todo cuanto alcanza su vista, que al observar desnuda y devora con la luz de su mirada. Los pastores que le han hecho compañía, figuras cansadas, rostros enjutos, las pieles que cubren sus cuerpos, el tosco mobiliario de madera, el costado de la peña, los insectos, las piedras que forman paredes, la fogata, la niña y la muchacha, la vieja y el cabrero mismo, cuya mirada encuentra la del peregrino y en su misterio se pierde. Bebe mi leche le ofrece. Come mi carne le dice.',
			'imagen': 'https://live.staticflickr.com/65535/51963941212_4e4e267719.jpg'
		},
	'serrano': {
			'titulo': '-Lo del viejo hidalgo-',
			'testimonio': 'Tres caminos abre la encrucijada. Hacia los altos de la sierra, de regreso al poblado en el valle, y hacia el albergue junto al mar. En otra parte otro camino trajo al viejo hidalgo a este lugar, uno invisible, trazado en el tiempo entre conquistas y batallas perdidas, la eliminación de su estirpe y el deseo de abandonar su lugar como instrumento de la máquina imperial que secretamente mueve al mundo. Gentil es el olvido que trajo consigo el pasar de los lustros en esta remota comarca rural. Apenas es capaz de conjurar en su memoria las carabelas quebradas que dejan de flotar, y el mancebo de su sangre, devorado antes de tiempo por las olas. Si tan solo hubiera sido el viejo quien herido de muerte se hundiera, y su muchacho el que hoy recorre bajo el sol este paraje de gardenias y aguacates, de abejas, mariposas y jilgueros, de acequias cristalinas que irrigan la tierra en que niños y sabuesos juegan, muchachas y muchachos cortejan, y el viejo hidalgo reposa.' + 
				'<br /><br />' + 
				'Con cautela se aproxima un hombre de mar entre los sauces junto al río. Las muchachas lo reciben, y lo acercan al anciano. Al caminar tocan su cuerpo y lo que queda de su ropa, novedosa visión que desconocen. Al viejo su mirada cansada lo engaña. La estatura, el porte, los andrajos elegantes. Su hijo que ha vuelto de la guerra. Un milagro de aquellos imposibles. Un resucitado. El peregrino se detiene frente al viejo y lo saluda, ya de cerca es otro.',
			'imagen': 'https://live.staticflickr.com/65535/51963941532_2d2ce6d6b7_w.jpg'
		},
	'novia': {
			'titulo': '-Lo de la novia-',
			'testimonio': 'Duerme la novia desnuda en su lecho, repleta, consumida, satisfecha. Ese otoño será madre. Afuera, la boda no termina de apagarse. Aromas delicados y tenues murmullos empapan la noche, la decoran. Guirnaldas de rosas, gardenias, madreselvas y jazmines, leña quemada y barbacoa de borrego, vino de ciruela y pulque de agave, grillos, tecolotes, macacos y otros bichos, ocultos en el negro follaje de la madrugada, el fuego que baila sin música en la hoguera, los necios comensales que resisten el peso del cansancio.' + 
			'<br /><br />' + 
			'En sueños la novia revive su boda. Las doncellas y los querubines, el baño de leche tibia, la ceremonia, la bendición del decano, el paseo por los jardines, los juegos, la danza, el banquete, la unión: recinto nupcial, batallas de amor: esposo espuma, campo de pluma. Del mar emerge su cuerpo hecho arena, litoral que se abre a la embestida de su amante, tormenta salvaje, un forastero elegante que nadie conoce.' + 
			'<br /><br />' +
			' Detrás de la montaña se avecina el sol. En un lodazal cercano el desposado se bate con sus amigos en competencia de lucha, sus cuerpos anudados, salamandras en la hiedra que se aferran a la noche.',
			'imagen': 'https://live.staticflickr.com/65535/51964945226_485fe33364_w.jpg'
		},
	'nereidas': {
			'titulo': '-Lo de las hijas del mar-',
			'testimonio': 'Seis hermanas habitan el islote con su padre y dos hermanos. La mayor es cazadora de monstruos marinos. Cada mañana los acecha con su arpón en la costa rocosa. Serpientes marinas, tiburones, leones de mar, celacantos, mantarrayas, cefalópodos, medusas, hombres lagarto. Siempre cerca está la menor, su ambición aprender a teñir de rojo las aguas con la gracia propia de su hermana.' + 
			'<br /><br />'+ 
			'Regresa la mayor con otra foca moribunda. Hilos de sangre bajan desde donde arrastra su presa hasta su padre, quien recorre la periferia en compañía de un extraño forastero que llegó con sus hermanos. A ella le inspira cierta sospecha inexplicable.' + 
			'<br /><br />' +
			'La menor se acerca y levanta otro arpón. Observa una sombra cercana entre las olas que acarician los escollos. Quiere impresionar al forastero que la ignora ensimismado frente a la presa muerta de su hermana. Lo encuentra sumamente atractivo. Por eso antes le ofreció el mejor manjar en existencia, un suculento ceviche de caracol preparado en su concha con agua de chile habanero, pero el hombre no pareció notar su cortejo.' + 
			'<br /><br />' +
			'Se hace a la mar y navega una barca diminuta en dirección a su presa. Se detiene. Hace flotar un artefacto de corcho y plomo a manera de falsa carnada, y en el momento preciso da una estocada que pinta de rojo las olas. Del agua emerge un monstruo descomunal que batalla en el aire, que no logra escapar del arpón que le atraviesa un costado. Se logra liberar de la muchacha, pero arrastra consigo el arpón al abismo, mortalmente malherido. La barca retorna. En la orilla no hay nadie.',
			'imagen': 'https://live.staticflickr.com/65535/51963941262_ce3e323017_w.jpg'
		},
	'castillo': {
			'titulo': '-Lo del castillo-',
			'testimonio': 'En su prisión de poder ha enfermado de soledad el príncipe, de aburrimiento que a falta de guerras aplaca con elaboradas expediciones de caza mayor, o menor, o hasta de brujas, herejes, y otros infieles.' + 
			'<br /><br />' + 
			'Un oficial anuncia con su catalejo. Un regalo del mar se aproxima. Es otro navegante solitario que se acerca entre las olas. Un aventurero desconocido con quien ir a cazar, organizar banquetes, y compartir cuentos y canciones de andanzas y hazañas en tierras remotas. El príncipe lo sabe. Pasarán los días, con suerte será semanas, e inevitablemente su huésped querrá echarse a la mar de nuevo, a continuar su saga errante, su peregrinaje sin destino.' + 
			'<br /><br />' +
			'Encadenado en las mazmorras otro peregrino se lamenta de haberse detenido a pedir albergue a la puerta del pálido castillo. En silencio entre las sombras los otros prisioneros escuchan.',
			'imagen': 'https://live.staticflickr.com/65535/51963941262_ce3e323017_w.jpg'
		}
};

/*
for (var personaje in personajes) {
	console.log(personajes[personaje]);
};
*/

function fillInfo(ID){
	imageURL = personajes[ID].imagen; 
	$('#story-pic').css( 'background-image', 'url(' + imageURL + ')' );
	$('#story-pic').css( 'background-position', 'center' );
	$('#story-pic').css( 'background-size', 'cover' );
	$('#story-information').html( '<h2>' + personajes[ID].titulo + '</h2>' + '<p style="font-size:1.1em; color:#444;">' + personajes[ID].testimonio + '</p>');
};

$(".personaje").click(function() {
	fillInfo($(this).attr('id'));
	$("#bg-popup").fadeIn('slow');
	$("#story-wrapper").fadeIn('slow');
});
$(".personaje-arena").click(function() {
	fillInfo($(this).attr('id').split("-")[0]);
	$("#bg-popup").fadeIn('slow');
	$("#story-wrapper").fadeIn('slow');
});
$("#close-button").click(function() {
	$("#bg-popup").fadeOut('slow');
	$("#story-wrapper").fadeOut('slow');
});
$("#footer-button").click(function() {
	$("#bg-popup").fadeOut('slow');
	$("#story-wrapper").fadeOut('slow');
});

//-------------------------- muchas gracias