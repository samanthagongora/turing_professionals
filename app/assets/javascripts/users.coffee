# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
    $("a[data-remote]").on "ajax:success", (e, data, status, xhr) ->
      a = $(e.target).children("span").removeClass("glyphicon-star-empty").addClass("glyphicon-star")
