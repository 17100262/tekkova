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
$(document).ready(function() {
$('.carousel-indicators li').addClass('carousel-li');
$('.carousel-li:eq(0)').addClass("active");
function image(){
  var now = $('.carousel-li.active').index() + 1;
var total = $('.carousel-li').length;
$('.image-quantity').text(now+" / "+total);
}  
image();
$(document).click(function() {
 image();
})


  
  
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
$(document).ready(function() {
$("html").addClass('js');


$( ".input-file-trigger" ).keydown(function(event) {  
    if ( event.keyCode == 13 || event.keyCode == 32 ) {  
        $( this ).closest(".input-file-container").children("input-file").focus();  
    }  
});
$( ".input-file-trigger" ).click(function() {
   $( this ).closest(".input-file-container").children("input-file").focus();
}); 
  
});
$(document).click(function() {
$(".input-file").change(function() {  
var values = $(this).val();
var filename = values.replace(/^.*\\/, "");
    $( this ).closest(".input-file-container").children(".file-return").html(filename); 
});
}); 
$(document).ready(function(){
   $('.custom-file-container__image-clear').hide();
    if(
   $('a[href="#finish"]').show()
    ){
        $('a[href="#finish"]').hide();
       $('a[href="#finish"]').closest('li').children('.submit-finish').show();
    }

});
   $( function() {
        $('.datepicker').datepicker({
            
        });
  });
  
  $(function() {
 
    var value1 = 0;
    var value2 = 0;
     
    function amountf(){
       
        var value3 = value1 * 5;
        var value4 = value3 + 25;
        var valuet = value4 * value2;
        var valuef = valuet * 52;
        
        $( "#amountf" ).val( "$" + valuef );
        
    }
    function amountf2(){
        var value1 = $( "#slider" ).slider( "value" );
        var value2 = $( "#slider2" ).slider( "value" );
        
        var value3 = value1 * 5;
        var value4 = value3 + 25;
        var valuet = value4 * value2;
        var valuef = valuet * 52;
        
        $( "#amountf" ).val( "$" + valuef );
    }
    $( "#slider" ).slider({
    orientation: "horizontal",
     range: "min",
      value:0,
      min: 0,
      max: 135,
      step: 0.5,
      slide: function( event, ui ) {
          value1 = ui.value;
          amountf();
      $( "#amount" ).val( "$" + (ui.value * 1000 + 15000)  );
      }
    });
    values1 = $( "#slider" ).slider( "value" );
    $( "#amount" ).val( "$" + (values1 * 1000 + 15000)    );

    $( "#slider2" ).slider({
    orientation: "horizontal",
     range: "min",
      value: 0,
      min: 0,
      max: 7,
      step: 1,
      slide: function( event, ui ) {         
          value2 = ui.value;
          amountf();
     $( "#amount2" ).val( ui.value );
      }
    });
    $( "#amount2" ).val( $( "#slider2" ).slider( "value" ) );
    amountf2();
  }); 
$('#myModal').on('shown.bs.modal', function (e) {
 $('.table-violate').DataTable({
        
        "aaSorting": [],
        pageLength: 10,
        responsive: true
    });
});
 $(document).ready(function(){
    
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
            },

            {
                extend: 'print',
                customize: function(win) {
                    $(win.document.body).addClass('white-bg');
                    $(win.document.body).css('font-size', '10px');

                    $(win.document.body).find('table')
                        .addClass('compact')
                        .css('font-size', 'inherit');
                }
            }
        ]
        
    });
$('.all_checkbox').change(function(){
if($('.all_checkbox').is(':checked')){
$('.check_box input[type="checkbox"]').prop('checked', true);
}
else{
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
 $('#wizard input[type=text]').val (function () {
     var caps = $(this).val();
    return caps.charAt(0).toUpperCase() + caps.slice(1);
});
});

$(document).on("mouseover",".btn-breadcrumb .btn-primary",function() {
if($(this).next().hasClass('active')){
$(this).next().addClass('zindex1');
}
if($(this).prev().hasClass('active')){
$(this).addClass("zindex1");
}
});
$(document).on("mouseup mouseout",".btn-breadcrumb .btn-primary",function() {
if($(this).next().hasClass('active')){
$(this).next().removeClass('zindex1');
}
if($(this).prev().hasClass('active')){
$(this).removeClass("zindex1");
}
});