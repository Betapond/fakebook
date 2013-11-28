class @FakebookCache

  constructor: ->
    console.log('CACHE')
    @cache = window._rawFakebookCache
    # Check if we have an injected cache 
  
  store: (path, response) ->
    @cache[path] = response

  fetch: (path) ->

  store: (url, response) ->
    key = generateKey(url)
    $.ajax
      type: "POST"
      url: "fakebook/cache/store"
      data:
        key: key
        response: response
  
  generateKey: (url) ->
    url.replace(/[^0-9A-Za-z.\-]/g,"_");
