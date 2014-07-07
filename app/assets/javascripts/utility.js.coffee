window.debounce = (func, wait, immediate) ->
  timeout = undefined
  (args...) ->
    context = this
    clearTimeout timeout
    timeout = setTimeout(->
      timeout = null
      func.apply context, args unless immediate
    , wait)
    func.apply context, args if immediate and not timeout