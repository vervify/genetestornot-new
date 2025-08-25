$( document ).ready(function() {
      console.log("wat2")

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