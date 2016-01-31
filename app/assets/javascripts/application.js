// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require featherlight
//= require featherlight-gallery
//= require jquery_ujs
//= require jquery-ui
//= require turbolinks
//= require_tree .

$(document).on('ready page:load', function () {
	$('.trigger').on("click", function() {
		$('body').toggleClass("mobile-nav");
	});

	$( "#dialog-message" ).hide();

	$("#next-button").click(function(e) {     
    if ($("input[class=check-box]:checked").val() == undefined){
    	  e.preventDefault();
			  $( "#dialog-message" ).show("fade");
    } else {
    	localStorage.setItem($("input[class=check-box]:checked").prop('name'), $("input[class=check-box]:checked").val());
    }
  });

  $("#modal").click(function(e){
  	e.preventDefault();
  	$("#dialog-message").show("fade");
  })

	$( ".modal-close" ).click(function() {
	  $( "#dialog-message" ).hide('fade');
	});
});


