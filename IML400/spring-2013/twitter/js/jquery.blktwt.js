//blktwt.js a generalization of
//blktwt.js by Harbor (http://blktwt.hrbor.com)

(function($){

 	$.fn.blktwt = function(options) { 

			//Declare defaults
			var defaults = {
				username : 'blackaller',
				query: '',
                count : 12,
                image_size: 48,
                convert_links: true,
                loader_text: 'loading',
                no_result: 'not found'
                
			}

			//Merge default with options
			var options =  $.extend(defaults, options);

			// customized parseTwitterDate. Base by http://stackoverflow.com/users/367154/brady - Special thanks to @mikloshenrich
			var parseTwitterDate = function(tdate) {
    
	    			var system_date = new Date(tdate.replace(/^\w+ (\w+) (\d+) ([\d:]+) \+0000 (\d+)$/, "$1 $2 $4 $3 UTC"));
	    			var user_date = new Date();
	
	    			var diff = Math.floor((user_date - system_date) / 1000);
	    			if (diff <= 1) {return "just now";}
	    			if (diff < 20) {return diff + " seconds ago";}
	    			if (diff < 40) {return "half a minute ago";}
	    			if (diff < 60) {return "less than a minute ago";}
	    			if (diff <= 90) {return "one minute ago";}
	    			if (diff <= 3540) {return Math.round(diff / 60) + " minutes ago";}
	    			if (diff <= 5400) {return "1 hour ago";}
	    			if (diff <= 86400) {return Math.round(diff / 3600) + " hours ago";}
	    			if (diff <= 129600) {return "1 day ago";}
	    			if (diff < 604800) {return Math.round(diff / 86400) + " days ago";}
	    			if (diff <= 777600) {return "1 week ago";}
	    			return "on " + system_date;
    
    		}
    		
    		return this.each(function() {
    		
				var o = options;
                var obj = $(this); 
                var q; 
                
				$(obj).append('<ul class="blktwt"></ul>');	
				$(".blktwt", obj).append('<li class="blktwt_loader blktwt_tweet" style="display:none;">' + o.loader_text + '</li>');	
				$(".blktwt_loader", obj).fadeIn('slow');
		
				//Check if there is a search query given, if not fetch user tweets
				if(o.query) {
					
					q = encodeURIComponent(o.query);
					
				} else {
					
					q = 'from:' + encodeURIComponent(o.username);
					
				}
		
				//get the tweets from the API
				$.getJSON('http://search.twitter.com/search.json?q=' + q + '&callback=?', function(data){ 

					var results = data['results'];
					
					if(results.length) {
						
						//Loop through results and append them to the parent
						for(var i = 0; i < o.count && i < results.length; i++) {
						
							var item = results[i];
							
							jtweet = '<li class="blktwt_tweet">';
		
			                if (o.image_size) {
			                
			                	today = new Date();
			  
				                jtweet += '<div class="blktwt_picture">';
				                jtweet += '<a href="http://twitter.com/' + item.from_user + '">'
				                jtweet += '<img width="' + o.image_size +'" height="' + o.image_size + '" src="' + item.profile_image_url + '" />';
				                jtweet += '</a>';
				                jtweet += '</div>';
			
			                } 
		
			                var tweettext = item.text;
			                var tweetdate = parseTwitterDate(item.created_at);
			                
			                if (o.convert_links) {
		
				                tweettext = tweettext.replace(/(http\:\/\/[A-Za-z0-9\/\.\?\=\-]*)/g,'<a href="$1">$1</a>');
				                tweettext = tweettext.replace(/@([A-Za-z0-9\/_]*)/g,'<a href="http://twitter.com/$1">@$1</a>');
				                tweettext = tweettext.replace(/#([A-Za-z0-9\/\.]*)/g,'<a href="http://twitter.com/search?q=$1">#$1</a>');
	
			                }
		
			                jtweet += '<p class="blktwt_tweet_text">' + tweettext + '</p>';
			                jtweet += '<a href="http://twitter.com/' + item.from_user + '/statuses/' + item.id_str + '" class="blktwt_date">' + tweetdate + '</a>';
			 
			                jtweet += '</li>';   				
			                
			                $(".blktwt", obj).append(jtweet);
	                
		                }   
						
					} else {
						
						//If there are not any tweets, display the "no results" container
						$(".blktwt_loader", obj).fadeOut('fast', function() {
							
							$(".blktwt", obj).append('<li class="blktwt_noresult blktwt_tweet" style="display:none;">' + o.no_result + '</li>');
							$(".blktwt_noresult", obj).fadeIn('slow');
							
						});   
						
						
					}
		
					$(".blktwt_loader", obj).fadeOut('fast');   
           
				});

			});
			
    	}

})(jQuery);