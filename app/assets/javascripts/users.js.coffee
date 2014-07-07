# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require mailcheck

$(".mailcheck").on 'keydown', debounce(->
  $this = $(this)
  $this.mailcheck
    topLevelDomains: ['com', 'net', 'org', 'me', 'us', 'io']
    suggested: (element, suggestion) ->
      $this.parent().addClass("hint")
      $this.siblings(".hint").html("Do you mean #{suggestion.full}?").show()
    empty: (element) ->
      $this.parent().removeClass("hint")
      $this.siblings(".hint").html("").hide()
, 250)