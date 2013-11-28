class @FakebookCache

  constructor: ->
    console.log('CACHE')
    @cache = window._rawFakebookCache
    # Check if we have an injected cache 
  
  store: (path, response) ->
    @cache[path] = response

  fetch: (path) ->
