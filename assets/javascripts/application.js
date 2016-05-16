//= require google-analytics

document.addEventListener("DOMContentLoaded", function(){
  var onLinkClick = function(e) {
    e.preventDefault();
    trackClick(e.target.href);
  };

  var trackClick = function(url) {
    ga('send', 'event', 'outbound', 'click', url, {
      transport: 'beacon',
       hitCallback: function(){document.location = url;}
    });
  };

  var links = document.getElementsByTagName('a');
  for(var i = 0; i < links.length; i++) {
    links[i].onclick = onLinkClick;
  }
});
