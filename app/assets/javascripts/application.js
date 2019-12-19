// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require fileinput
//= require toastr
//= require cocoon
//= require_tree .
toastr.options = {
  "closeButton": true,
  "debug": false,
  "progressBar": true,
  "positionClass": "toast-top-right",
  "showDuration": "300",
  "hideDuration": "1000",
  "timeOut": "5000",
  "extendedTimeOut": "1000",
  "showEasing": "swing",
  "hideEasing": "linear",
  "showMethod": "fadeIn",
  "hideMethod": "fadeOut"
}
  function image() {
    var now = $('.carousel-li.active').index() + 1;
    var total = $('.carousel-li').length;
    $('.image-quantity').text(now + " / " + total);
    if(now > 4){
      var n = $(".article-slide .carousel-indicators").height();
    $('.article-slide .carousel-indicators').animate({ scrollTop: n }, 0);
    }
    else{
     $('.article-slide .carousel-indicators').animate({ scrollTop: 0 }, 0); 
    }
  }
$(document).ready(function() {
  image();
  $('.carousel-indicators li').addClass('carousel-li');
  $('.carousel-li:eq(0)').addClass("active");

  toastr.options.closeHtml = '<button><i class="icon-on"></i></button>';
  toastr.options.closeHtml = true;
  $('.alert').delay(2000).fadeOut();
  $('#multi-form input[type="text"]').addClass('form-control');
  $('#multi-form input[type="number"]').addClass('form-control');
  $('#multi-form input[type="date"]').addClass('form-control');
  $('#multi-form select').addClass('form-control');
  $('#multi-form textarea').addClass('form-control');
  $('#multi-form-d input[type="text"]').addClass('form-control');
  $('#multi-form-d input[type="number"]').addClass('form-control');
  $('#multi-form-d input[type="date"]').addClass('form-control');
  $('#multi-form-d select').addClass('form-control');
  $('#multi-form-d textarea').addClass('form-control');
  $('#multi-form input[type="text"]').attr("required", true);
  $('#multi-form input[type="number"]').attr("required", true);
  $('#multi-form input[type="checkbox"]').attr("required", true);
  $('#multi-form input[type="radio"]').attr("required", true);
  $('#multi-form input[type="date"]').attr("required", true);
  $('#user_driving_liecense_middlename').removeAttr("required");
  $('#multi-form select').attr("required", true);
  $('#multi-form textarea').attr("required", true);
});
  $(document).bind('ready click keyup mousedown mouseup change', function() {
    image();
  })
$(document).ready(function() {
  $("html").addClass('js');
  $(".input-file-trigger").keydown(function(event) {
    if (event.keyCode == 13 || event.keyCode == 32) {
      $(this).closest(".input-file-container").children("input-file").focus();
    }
  });
  $(".input-file-trigger").click(function() {
    $(this).closest(".input-file-container").children("input-file").focus();
  });
});
$(document).click(function() {
  $(".input-file").change(function() {
    var values = $(this).val();
    var filename = values.replace(/^.*\\/, "");
    $(this).closest(".input-file-container").children(".file-return").html(filename);
  });
});
$(document).ready(function() {
  $('.custom-file-container__image-clear').hide();
  if ($('a[href="#finish"]').show()) {
    $('a[href="#finish"]').hide();
    $('a[href="#finish"]').closest('li').children('.submit-finish').show();
  }
});
$(function() {
  $('.datepicker').datepicker({});
});
$(function() {
  var value1 = 0;
  var value2 = 0;

  function amountf() {
    var value3 = value1 * 5;
    var value4 = value3 + 25;
    var valuet = value4 * value2;
    var valuec = valuet * 52;
    var valuef = valuec * 0.46 ;
    $("#amountf").val("$" + Math.trunc(valuef));

  }

  function amountf2() {
    var value1 = $("#slider").slider("value");
    var value2 = $("#slider2").slider("value");
    var value3 = value1 * 5;
    var value4 = value3 + 25;
    var valuet = value4 * value2;
    var valuef = valuet * 52;
    $("#amountf").val("$" + valuef);
  }
  $("#slider").slider({
    orientation: "horizontal",
    range: "min",
    value: 0,
    min: 0,
    max: 135,
    step: 0.5,
    slide: function(event, ui) {
      value1 = ui.value;
      amountf();
      $("#amount").val("$" + (ui.value * 1000 + 15000));
    }
  });
  values1 = $("#slider").slider("value");
  $("#amount").val("$" + (values1 * 1000 + 15000));
  $("#slider2").slider({
    orientation: "horizontal",
    range: "min",
    value: 0,
    min: 0,
    max: 7,
    step: 1,
    slide: function(event, ui) {
      value2 = ui.value;
      amountf();
      $("#amount2").val(ui.value);
    }
  });
  $("#amount2").val($("#slider2").slider("value"));
  amountf2();
});
$('#myModal').on('shown.bs.modal', function(e) {
  $('.table-violate').DataTable({
    "aaSorting": [],
    pageLength: 10,
    responsive: true
  });
});
$(document).ready(function() {
  $('.table-violation').DataTable({
    "aaSorting": [],
    pageLength: 25,
    responsive: true
  });
  $('.table-data').DataTable({
    "aaSorting": [],
    pageLength: 25,
    responsive: true,
    dom: '<"html5buttons"B>lTfgitp',
    buttons: [{
      extend: 'copy'
    }, {
      extend: 'csv'
    }, {
      extend: 'excel',
      title: 'ExampleFile'
    }, {
      extend: 'pdf',
      title: 'ExampleFile'
    }, {
      extend: 'print',
      customize: function(win) {
        $(win.document.body).addClass('white-bg');
        $(win.document.body).css('font-size', '10px');
        $(win.document.body).find('table').addClass('compact').css('font-size', 'inherit');
      }
    }]
  });
  $('.all_checkbox').change(function() {
    if ($('.all_checkbox').is(':checked')) {
      $('.check_box input[type="checkbox"]').prop('checked', true);
    } else {
      $('.check_box input[type="checkbox"]').prop('checked', false);
    }
  });
});

function avatarchange() {
  $("#profileImage").mouseover(function() {
    $("#icon-span").show();
    $("#profileImage").css('opacity', '0.5');
    $("#profileImage").css('background', 'rgba(0,0,0,0.5)');
    $("#profileImage").css('cursor', 'pointer');
  });
  $("#icon-span").mouseover(function() {
    $("#icon-span").show();
    $("#profileImage").css('opacity', '0.5');
    $("#profileImage").css('background', 'rgba(0,0,0,0.5)');
  });
  $("#profileImage").mouseout(function() {
    $("#icon-span").hide();
    $("#profileImage").css('opacity', '1');
    $("#profileImage").css('background', 'rgba(0,0,0,0)');
  });
}
$(document).ready(function() {
  avatarchange();
  $('#wizard input[type=text]').keyup(function() {
    var caps = $(this).val();
    caps = caps.charAt(0).toUpperCase() + caps.slice(1);
    $(this).val(caps);
  });
  $('#wizard input[type=text]').val(function() {
    var caps = $(this).val();
    return caps.charAt(0).toUpperCase() + caps.slice(1);
  });
});
$(document).on("mouseover", ".btn-breadcrumb .btn-primary", function() {
  if ($(this).next().hasClass('active')) {
    $(this).next().addClass('zindex1');
  }
  if ($(this).prev().hasClass('active')) {
    $(this).addClass("zindex1");
  }
});
$(document).on("mouseup mouseout", ".btn-breadcrumb .btn-primary", function() {
  if ($(this).next().hasClass('active')) {
    $(this).next().removeClass('zindex1');
  }
  if ($(this).prev().hasClass('active')) {
    $(this).removeClass("zindex1");
  }
});

function modal_click() {
  $(".open-modal").click(function() {
    var empty = $("#new_user input").filter(function() {
      return this.value === "";
    });
    var file = $("#new_user input[type='file']").filter(function() {
      return this.value === "";
    });
    var checkbox = $("#new_user input[type='checkbox'][required]").filter(function() {
      return $(this).is(':checked') == false;
    });
    var email = $("#new_user input[type='email']").filter(function() {
      var emailv = $(this).val();
      var regEx = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
      var validEmail = regEx.test(emailv);
      if ($(this).val() != "") {
        return validEmail == false;
      }
    });
    if (empty.length) {
      $("#new_user input").removeClass('warning');
      $(".warning-red").hide();
      empty.addClass('warning');
      file.before("<p class='warning-red mb-0'>Please select a file</p>");
      checkbox.before("<p class='warning-red mb-0'>Please check this box if you want to proceed</p>");
      email.before("<p class='warning-red mb-0'>Please write valid email</p>");
      email.addClass("warning");
    } else {
      $(".warning-red").hide();
      $("#new_user input").removeClass('warning');
      $('.open-modal-abc').click();
    }
  });
  $("#new_user input").bind('focusout change', function() {
    var empty = $(this).filter(function() {
      return this.value === "";
    });
    if (empty.length) {
      $(this).removeClass('warning');
      $(".warning-red").hide();
      empty.addClass('warning');
    } else {
      $(".warning-red").hide();
      $(this).removeClass('warning');
    }
  });
}

function modal_click_2() {
  $(".open-modal").click(function() {
    var checkbox = $("#new_user input[type='checkbox'][required]").filter(function() {
      return $(this).is(':checked') == false;
    });
    if (empty.length) {
      $(".warning-red").hide();
      checkbox.before("<p class='warning-red mb-0'>Please check this box if you want to proceed</p>");
    } else {
      $(".warning-red").hide();
      $('.open-modal-abc').click();
    }
  });
}
$(document).ready(function() {
  modal_click();
});
$(document).click(function() {
  modal_click_2();
});


/* jQuery Google Analytics Plugin https://github.com/shamasis/jquery-ga - http://www.shamasis.net/projects/ga/ @version 2.0.2 */
(function(b){var d=window,c,f=function(a,b){return function(){a.apply(c,b)}},g=function(){var a;if(!c)throw"Tracker has not been defined";for(a in c)"_"===a.charAt(0)&&b.isFunction(c[a])&&(b.ga[a.substr(1)]=f(c[a],arguments))};b.ga={};b.ga.load=function(a,e){b.ajax({type:"get",url:("https:"===document.location.protocol?"https://ssl":"http://www")+".google-analytics.com/ga.js",cache:!0,success:function(){if(!d._gat||!d._gat._getTracker)throw"Tracker has not been defined";c=d._gat._getTracker(a);g();
b.isFunction(e)&&e(c);c._trackPageview()},dataType:"script",data:null})}})(jQuery);

// création du cookie
function createCookie(name, value, days) {
    if(days){
		var date = new Date();
		date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
		var expires = "; expires=" + date.toGMTString();
	}
	else var expires = "";
	document.cookie  = name + "=" + value + expires + "; path=/";
}
// lecture du cookie
function readCookie(name) {
	var nameEQ = name + "=";
	var ca     = document.cookie.split(';');
	for(var i = 0; i < ca.length; i ++) {
		var c = ca[i];
		while (c.charAt(0) == ' ') c = c.substring(1, c.length);
		if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
	}
	return null;
}

$( window ).load(function() {
    // Notifications pour les cookies
    var cookie_avert   = readCookie("cookie_avert"),
        g_analytics_id = "xxxxxx-x", // Id unique google analytics 
        domain_name    = "www.tekkova.com"; // nom de domaine du site

    if(cookie_avert === null) { // si le cookie n'existe pas
        banner_text = 'Please use a PC, laptop or a tablet instead of a mobile phone to signup, list your vehicle or if you are simply just browsing tekkova, in order to have a smoother experience, Thank you. <button class="btn btn-success btn-gradient btn-sm" id="accept-cookie"><i class="fas fa-check"></i></button>';
        $("body").prepend('<div id="cookies-banner" class="alert alert-info pr-5">' + banner_text + '</div>');
        
        // si on accepte, le cookie avec la valeur 'set' est créée, sinon, la valeur 'not'
        $("#accept-cookie").click(function(){
            id_button     = $(this).attr("id");
            action_button = (id_button == "accept-cookie")? 'set' : 'not';
        
            createCookie("cookie_avert", action_button, 365);
    	    $("#cookies-banner").slideUp(350).remove();
        
            if(action_button == "set"){ // le cookie avec la valeur 'set' est créée (accept)
                // on charge Google analytics
                $.ga.load(g_analytics_id, function(pageTracker) {
    	    		pageTracker._setDomainName(host);
				});
            }
        });
    
        // si aucune action au bout de 10 secondes (implicite)
        setTimeout(function(){
          createCookie("cookie_avert", 365);
            $("#cookies-banner").slideUp(350).remove();
            
            // on charge Google analytics
            $.ga.load(g_analytics_id, function(pageTracker) {
    	    	pageTracker._setDomainName(host);
			});
        }, 15000); // 10 sec
        
    }else if(cookie_avert == "set"){ // si le cookie existe avec la valeur 'set'
        // on charge google analytics
        $.ga.load(g_analytics_id, function(pageTracker) {
    	    pageTracker._setDomainName(host);
		});
    }
});

var text_max = 50;
$('#count_text').html(text_max + ' remaining');

$(document).ready(function() {
    $(".words_count").on('keyup', function() {
        var words = this.value.match(/\S+/g).length;
        if (words > 50) {
            // Split the string on first 200 words and rejoin on spaces
            var trimmed = $(this).val().split(/\s+/, 50).join(" ");
            // Add a space at the end to keep new typing making new words
            $(this).val(trimmed + " ");
            alert('You can\'t enter more than 30 words. Your introduction will be trimmed to 30 words.');
        } else {

            $('#count_text').html('' + 50 - words + ' remaining');
        }
    });
});

$(document).ready(function(){
  var chk1 = $("input:checkbox[name='offer1']");
  var chk2 = $(("input:checkbox[name='offer2']"));
  chk1.on('change', function(){
  chk2.prop('checked',this.checked);
});
});
