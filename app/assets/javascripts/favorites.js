document.addEventListener("turbolinks:load", function(){

$(document).ready(function(){
    $("a.favorite-star").on("ajax:success", function(e, data, status, xhr) {
      const a = $(e.target);
      const span = a.children("span").first();
      if (span.hasClass("glyphicon-star")) {
        span.removeClass("glyphicon-star");
        span.addClass("glyphicon-star-empty");
        return a.attr('data-method', 'post');
      } else {
        span.removeClass("glyphicon-star-empty");
        span.addClass("glyphicon-star");
        return a.attr('data-method', 'delete');
      }
});
