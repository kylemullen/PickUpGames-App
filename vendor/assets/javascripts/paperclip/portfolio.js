/*------------------------------------------------------------------
Project:    Paperclip
Author:     Yevgeny S.
URL:        http://simpleqode.com/
            https://twitter.com/YevSim
Version:    1.1
Created:        11/03/2014
Last change:    14/08/2014
-------------------------------------------------------------------*/

// Isotop Gallery 
// ==============

var $container = $('#isotope-container');
    $container.isotope({
    itemSelector : '.isotope-item',
});
$('#filters a').click(function(){
    var selector = $(this).attr('data-filter');
    $container.isotope({ filter: selector });
    return false;
});