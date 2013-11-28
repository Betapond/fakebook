#= require jquery
#= require fakebookcache

@Fakebook = (( global, doc, $) ->
  self = {}
  _FB = null

  self.cache = new FakebookCache

  self.init = (params) ->
    _FB.init(params)
    console.log('init called')

  self.login = (callback = null, options = {}) ->
    _FB.login(callback, options)
    console.log('login called')

  self.logout = ->
    console.log('logout called')

  self.getLoginStatus = (callback, remote = false) ->
    if true
      _FB.getLoginStatus(callback, remote)
    else
      console.log('get login status called')
      callback.call(global,
        status: "connected"
        authResponse:
          accessToken: "..."
          expiresIn: "..."
          signedRequest: "..."
          userID: "...")

  self.api = (path, params = {}, method = 'get', callback = ->) ->

    if typeof params is 'function'
      callback = params
      params = {}
    
    if true
      _FB.api(path, params, method, callback)
    else
      callback.call(global, result)


  replaceFbAsyncInit = ->
    self._fbAsyncInit = window.fbAsyncInit
    window.fbAsyncInit = ->
      _FB = $.extend({}, window.FB)
      $.extend(window.FB, window.Fakebook)
      # window.FB = FakeBook
      Fakebook._fbAsyncInit()
 
  patchJqueryGetScript = ->
    _getScript = $.getScript
    $.getScript = (url, cb = ->) ->
      unless /connect\.facebook\.net/.test(url)
        _getScript(url, cb)


  # patchJqueryGetScript()

  replaceFbAsyncInit()
  self

)( window, document, $)
