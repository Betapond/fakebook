class @FakebookCache

  constructor: ->
    @cache = window._fakebookCache

  fetch: (path, params = {}) ->
    key = @generateKey(path, params)
    @cache[key]

  store: (path, response, params = {}, force = false) ->
    key = @generateKey(path, params)
    if !force && @cache[key] != undefined
      console.warn("Fakebook: Cache response for #{path} already exists")
    else
      @cache[key] = response
      
      $.ajax
        type: "POST"
        url: "/fakebook/cache/store"
        dataType: 'json'
        data:
          key: JSON.stringify(key)
          response: JSON.stringify(response)
  
  generateKey: (path, params) ->
    if typeof path == 'object'
      path = "#{path.method} #{path.query}"
    path = path + JSON.stringify(params)
    path = path.replace(/[^0-9A-Za-z.\-]/g,"_")
    if path.length > 100
      path = path.slice(0, 100) + Math.abs(@hash(path))

    path

  hash: (key) -> 
    hash = 0
    i = undefined
    char = undefined
    return hash  if key.length is 0
    i = 0
    l = key.length

    while i < l
      char = key.charCodeAt(i)
      hash = ((hash << 5) - hash) + char
      hash |= 0 # Convert to 32bit integer
      i++
    hash
