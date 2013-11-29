#= require fakebookcache

@Fakebook = ((window, doc, $) ->
  fakebook = {}
  _FB = null

  fakebook.cache = new FakebookCache

  fakebook.init = (params) ->
    _FB.init(params)
    console.log('init called')

  fakebook.login = (callback = null, options = {}) ->
    path = 'login'
    cached = fakebook.cache.fetch(path)
    if cached == undefined || cached.status != 'connected'
      _FB.login(responseWrapper(path, callback), options)
    else
      callback.call(window, cached)

    console.log('login called')

  fakebook.getLoginStatus = (callback, remote = false) ->
    path = 'getLoginStatus'
    cached = fakebook.cache.fetch(path)
    if cached == undefined || cached.status != 'connected'
      _FB.getLoginStatus(responseWrapper(path, callback, {}, true), remote)
    else
      callback.call(window, cached)

  fakebook.api = (path, params = {}, method = 'get', callback = ->) ->
    if typeof params is 'function'
      callback = params
      params = {}

    if typeof method is 'function'
      callback = method
      method = 'get'

    cached = fakebook.cache.fetch(path, params)
    if cached == undefined
      # deal with FQL
      if typeof path == 'object'
        _FB.api(path, responseWrapper(path, callback))
      else if path == 'search'
        _FB.api(path, params, responseWrapper(path, callback, params))
      else
        _FB.api(path, params, method, responseWrapper(path, callback))
    else
      callback.call(window, cached)

  responseWrapper = (url, callback, params = {}, force = false) ->
    (response) ->
      fakebook.cache.store(url, response, params, force)
      callback.call(window, response)

  replaceFbAsyncInit = ->
    fakebook._fbAsyncInit = window.fbAsyncInit
    window.fbAsyncInit = ->
      _FB = $.extend({}, window.FB)
      $.extend(window.FB, window.Fakebook)
      Fakebook._fbAsyncInit()

  # patchJqueryGetScript = ->
  #   _getScript = $.getScript
  #   $.getScript = (url, cb = ->) ->
  #     unless /connect\.facebook\.net/.test(url)
  #       _getScript(url, cb)


  # patchJqueryGetScript()

  replaceFbAsyncInit()
  fakebook

)(window, document, $)
