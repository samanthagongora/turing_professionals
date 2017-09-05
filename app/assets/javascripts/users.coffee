# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
    $("a[data-remote]").on "ajax:success", (e, data, status, xhr) ->
      a = $(e.target)
      span = a.children("span").first()
      if span.hasClass("glyphicon-star")
        span.removeClass("glyphicon-star")
        span.addClass("glyphicon-star-empty")
        a.attr('data-method', 'post')
      else
        span.removeClass("glyphicon-star-empty")
        span.addClass("glyphicon-star")
        a.attr('data-method', 'delete')
