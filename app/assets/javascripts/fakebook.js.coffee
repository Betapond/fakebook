#= require fakebookcache

@Fakebook = (( global, doc, $) ->
  fakebook = {}
  _FB = null

  fakebook.cache = new FakebookCache

  fakebook.init = (params) ->
    _FB.init(params)
    console.log('init called')

  fakebook.login = (callback = null, options = {}) ->
    _FB.login(callback, options)
    console.log('login called')

  fakebook.logout = ->
    console.log('logout called')

  fakebook.getLoginStatus = (callback, remote = false) ->
    if true
      _FB.getLoginStatus(callback, remote)

    else
      console.log('get login status called')


  fakebook.api = (path, params = {}, method = 'get', callback = ->) ->

    if typeof params is 'function'
      callback = params
      params = {}
    
    if true
      _FB.api(path, params, method, responseWrapper(path, callback))
    else
      callback.call(global, result)

  responseWrapper = (url, callback) ->
    (response) ->
      fakebook.cache.store(url, response)
      callback.call(window, response)
      

  replaceFbAsyncInit = ->
    fakebook._fbAsyncInit = window.fbAsyncInit
    window.fbAsyncInit = ->
      _FB = $.extend({}, window.FB)
      $.extend(window.FB, window.Fakebook)
      # window.FB = FakeBook
      Fakebook._fbAsyncInit()
 
  # patchJqueryGetScript = ->
  #   _getScript = $.getScript
  #   $.getScript = (url, cb = ->) ->
  #     unless /connect\.facebook\.net/.test(url)
  #       _getScript(url, cb)


  # patchJqueryGetScript()

  replaceFbAsyncInit()
  fakebook

)( window, document, $)
