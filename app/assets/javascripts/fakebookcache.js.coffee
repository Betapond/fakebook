class @FakebookCache

  constructor: ->
    @cache = window._fakebookCache

  fetch: (path) ->
    key = @generateKey(path)
    @cache[key]

  store: (path, response) ->
    key = @generateKey(path)
    @cache[key] = response
    
    $.ajax
      type: "POST"
      path: "/fakebook/cache/store"
      data:
        key: key
        response: response
  
  generateKey: (path) ->
    path.replace(/[^0-9A-Za-z.\-]/g,"_")
