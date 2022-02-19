// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= link_tree ../assets/images
//= link_directory ../assets/stylesheets .css

import "trix"
import "@rails/actiontext"
// import * as $ from 'jquery';
// import * as jQuery from 'jquery';
// import * as jQuery from 'jquery';
import '/jquery-global';
import "tablesorter";
import "quicksearch";
import "slick";
// window.quicksearch = quicksearch;

// window.tablesorter = tablesorter;


jQuery.ajaxSetup({
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

jQuery.fn.submitWithAjax = function() {
  this.submit(function() {
    $.post(this.action, $(this).serialize(), null, "script");
    $('.spinning').show();
    return false;
  })
  return this;
};

jQuery.fn.send_invoice = function (){
  this.on('click', function() {
    var invoice_id =  $(this).attr("data-id");
    var object =  $(this).attr("data-object");
    $('#spinning_' + invoice_id).show();
  $.getScript("/invoice_send/" + invoice_id )
    })
};
jQuery.fn.send_reminder = function (){
  this.on('click', function() {

    var invoice_id =  $(this).attr("data-id");
    $('#spinning_' + invoice_id).show();
 	 $.getScript("/send_reminder/" + invoice_id)
    })
};
jQuery.fn.send_credit_note = function (){
  this.on('click', function() {

    var invoice_id =  $(this).attr("data-id");
    $('#spinning_' + invoice_id).show();
 	 $.getScript("/credit_note/" + invoice_id)
    })
};




$(document).ready(function() {

  $('.scroller').slick({

    //
     dots: true,
    centerMode: true,
    centerPadding: '40px',
    // focusOnSelect: true
    responsive: [
       {
         breakpoint: 10240,
         settings: {
           slidesToShow: 5,
           slidesToScroll: 1,
           infinite: true,
           dots: true
         }
       },
       {
         breakpoint:2200,
         settings: {
           slidesToShow: 4,
           slidesToScroll: 1,
           infinite: true,
           dots: true
         }
       },
       {
         breakpoint:1800,
         settings: {
           slidesToShow: 3,
           slidesToScroll: 1,
           infinite: true,
           dots: true
         }
       },
       {
         breakpoint: 1400,
         settings: {
           slidesToShow: 2,
           slidesToScroll: 1
         }
       },
       {
         breakpoint: 1000,
         settings: {
           slidesToShow: 1,
           slidesToScroll: 1
         }
       },
       {
         breakpoint: 760,
         settings: {
           slidesToShow: 1,
           slidesToScroll: 1
         }
       }

       // You can unslick at a given breakpoint now by adding:
       // settings: "unslick"
       // instead of a settings object
     ]
  })
  //
  // $('#fullpage').fullpage({
  //   //Navigation
  //   sectionsColor: ['#2b1547', '#173414', '#194379', '#f46015', '#2b1547', '#173414', '#194379', '#f46015'],
  //       // anchors: ['index', 'kurs', 'news'],
  //       menu: '#menu',
  //       continuousVertical: true,
  //       resize : false
  // });
	$('input#search').quicksearch('table.tablesorter tbody tr', {

	});
  $('.square').click(function(){
    var id = this.id
    window.location.href = '/registrations/new?id=' + id;
  })
	$(".tablesorter").tablesorter();
	$(".send_link").send_invoice();
  $(".send_link_credit").send_credit_note();
	$(".send_link_reminder").send_reminder();

    /*
      Progressive enhancement.  If javascript is enabled we change the body class.  Which in turn hides the checkboxes with css.
    */
    $('body').attr("class","js");

    /*
      Add toggle switch after each checkbox.  If checked, then toggle the switch.
    */

     /*
      When the toggle switch is clicked, check off / de-select the associated checkbox
     */

    $('.toggle').click(function(e) {
		var id = $(this).attr('data_id')
		$("#paid_spinning_" + id).show();
		$.get("/set_paid/" + id);


      e.preventDefault();

    });


  });
