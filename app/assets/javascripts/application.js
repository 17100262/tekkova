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
//= require rails-ujs
//= require fileinput
//= require cocoon
//= require_tree .

$(document).ready(function() {
   $('.alert').delay(2000).fadeOut();
   $('#multi-form input[type="text"]').addClass('form-control');
   $('#multi-form input[type="number"]').addClass('form-control');
   $('#multi-form input[type="date"]').addClass('form-control');
   $('#multi-form select').addClass('form-control');
   $('#multi-form textarea').addClass('form-control');
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
    //     var value1 = $( "#slider" ).slider( "value" );
    //     var value2 = $( "#slider2" ).slider( "value" );
    // function amountf(){
        
    //     var value3 = value1 / 400;
    //     var value4 = value3 * value2;
    //     var valuef = value4 * 52;
        
    //     $( "#amountf" ).val( "$" + valuef );
    // }
    // function amountf2(){
    //     var value1 = $( "#slider" ).slider( "value" );
    //     var value2 = $( "#slider2" ).slider( "value" );
        
    //     var value3 = value1 / 400;
    //     var value4 = value3 * value2;
    //     var valuef = value4 * 52;
        
    //     $( "#amountf" ).val( "$" + valuef );
    // }
    // $( "#slider" ).slider({
    //   value:20000,
    //   min: 20000,
    //   max: 150000,
    //   step: 1000,
    //   slide: function( event, ui ) {
    //     amountf();
    //     $( "#amount" ).val( "$" + ui.value );
    //   }
    // });
    // $( "#amount" ).val( "$" + $( "#slider" ).slider( "value" ) );
 
    // $( "#slider2" ).slider({
    //   value:3,
    //   min: 1,
    //   max: 7,
    //   step: 1,
                    
    //   slide: function( event, ui ) {
    //     amountf();
    //     $( "#amount2" ).val( ui.value );
    //   }
    // });
    // $( "#amount2" ).val( $( "#slider2" ).slider( "value" ) );
    // amountf2();
    
  });
  
  
  
  
  $(function() {
 
    var value1 = 0;
    var value2 = 0;
     
    function amountf(){
        
       
        var value3 = value1 / 400;
        var value4 = value3 * value2;
        var valuef = value4 * 52;
        
        $( "#amountf" ).val( "$" + valuef );
        
    }
    function amountf2(){
        var value1 = $( "#slider" ).slider( "value" );
        var value2 = $( "#slider2" ).slider( "value" );
        
        var value3 = value1 / 400;
        var value4 = value3 * value2;
        var valuef = value4 * 52;
        
        $( "#amountf" ).val( "$" + valuef );
    }
    $( "#slider" ).slider({
    orientation: "horizontal",
     range: "min",
      value:20000,
      min: 20000,
      max: 150000,
      step: 1000,
      slide: function( event, ui ) {
          value1 = ui.value;
          amountf();
      $( "#amount" ).val( "$" + ui.value );
      }
    });
    $( "#amount" ).val( "$" + $( "#slider" ).slider( "value" ) );

    $( "#slider2" ).slider({
    orientation: "horizontal",
     range: "min",
      value:0,
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

