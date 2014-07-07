# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require mailcheck

$("#user_email").on 'blur', ->
  $this = $(this)
  $this.mailcheck
    suggested: (element, suggestion) ->
      $this.siblings(".hint").html("Do you mean #{suggestion.full}?").show()
    empty: (element) ->
      $this.siblings(".hint").html("").hide()