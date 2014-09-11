// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(document).on('ready page:load',function(){
	$('#story_url').change(function(){

		var urlTheyTyped= $(this).val();
		$.getJSON('/stories/lookup', {url: urlTheyTyped }, function(response) {
			var exists = response['exists'];

			if (exists){
				$('#story-url-message').text("This URL has already been entered");
			}
			else {
				$('#story-url-message').text("Good to go ..");
			}

		});	
	});
});

