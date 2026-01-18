var people = {
	'paco': {
			'name': 'Paco el Taco',
			'biography': 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.',
			'picture': 'http://farm9.staticflickr.com/8357/8321203454_cffe7a92f1_m.jpg'
		},
	'luis': {
			'name': 'Luis Blackaller',
			'biography': 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore <a href="http://black.mitplw.com">magnam aliquam quaerat voluptatem</a>. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?',
			'picture': 'http://farm9.staticflickr.com/8259/8662461612_0190aca83f_m.jpg'
		},
	'tony': {
			'name': 'Antonio Banderas',
			'biography': 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore <a href="http://black.mitplw.com">magnam aliquam quaerat voluptatem</a>. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?',
			'picture': 'https://pbs.twimg.com/profile_images/3009373624/dc15c6eaed8ed10a8b4d17a0e37c5f77.jpeg'
		},
	'luna': {
			'name': 'Luna White',
			'biography': 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?',
			'picture': 'http://2.bp.blogspot.com/-lsNOd19gZbM/TbHRje_DnGI/AAAAAAAAAI4/m0ty7ap_H-c/s1600/luna+white.jpeg'
		}
};

var videoWidth = 853;
var videoheight = 480;
var videoFrameSize = '<iframe width="' + videoWidth + '"height="' + videoheight;

var videos = {
	'guillotine': {
			'artist': 'Death Grips',
			'title': 'Guillotine (It goes Yah)',
			'youtube_url': 'http://youtu.be/Orlbo9WkZ2E',
			'youtube_embed': videoFrameSize + '" src="https://www.youtube.com/embed/Orlbo9WkZ2E" frameborder="0" allowfullscreen></iframe>',
			'button_coordinates': [20, 20]
		},
	'100_bottles': {
			'artist': 'Low Pros',
			'title': '100 Bottles (feat. Travi$ Scott)',
			'youtube_url': 'http://youtube.com/watch?v=ZVhKub975yg',
			'youtube_embed': videoFrameSize + '" src="https://www.youtube.com/embed/ZVhKub975yg" frameborder="0" allowfullscreen></iframe>',
			'button_coordinates': [40, 80]
		},
	'core': {
			'artist': 'RL Grime',
			'title': 'Core',
			'youtube_url': 'https://www.youtube.com/watch?v=04ufimjXEbA',
			'youtube_embed': videoFrameSize + '" src="https://www.youtube.com/embed/04ufimjXEbA" frameborder="0" allowfullscreen></iframe>',
			'button_coordinates': [60, 140]
		},
	'e-pro': {
			'artist': 'Beck',
			'title': 'E-Pro',
			'youtube_url': 'https://www.youtube.com/watch?v=RIrG6xBW5Wk',
			'youtube_embed': videoFrameSize + '" src="https://www.youtube.com/embed/RIrG6xBW5Wk" frameborder="0" allowfullscreen></iframe>',
			'button_coordinates': [80, 200]
		}
};


makeButtons();

function makeButtons() {
	content = document.createElement( 'div' );

	for (var clip in videos) {
		console.log(videos[clip]);
		content.innerHTML = content.innerHTML + "<div class='clip' id='"
			+ clip.toString() + "'>" + videos[clip].artist + ": " + videos[clip].title + "</div>";
	};

	document.body.appendChild( content );

	for (var clip in videos) {
		$("#" + clip.toString()).css("position", "absolute");
		$("#" + clip.toString()).css("left", videos[clip].button_coordinates[0] + "px");
		$("#" + clip.toString()).css("top", videos[clip].button_coordinates[1] + "px");
	};
};


function fillPopUp(clip){
	imageURL = videos[clip].youtube_url;
	$('#popup-panel').css("width", videoWidth + "px");
	$('#popup-panel').css("max-width", videoWidth + "560px");
	$('#popup-header').css("width", videoWidth + "px");
	$('#popup-header').css("max-width", videoWidth + "560px");
	$('#popup-embed').html( videos[clip].youtube_embed );
	$('#popup-info').html( '<h2>' + videos[clip].artist + '</h2>' + '<h3>' + videos[clip].title + '</h3>' );
};