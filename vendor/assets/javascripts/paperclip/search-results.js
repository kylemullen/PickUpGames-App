/*------------------------------------------------------------------
Project:    Paperclip
Author:     Yevgeny S.
URL:        http://simpleqode.com/
            https://twitter.com/YevSim
Version:    1.1
Created:        11/03/2014
Last change:    14/08/2014
-------------------------------------------------------------------*/

$('.b-search-results-info__sort-by > li').on('click', function() {
    $('.b-search-results-info__sort-by > li').removeClass('active');
    $(this).addClass('active');
});