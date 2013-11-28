module Fakebook
  class DataInjectorMiddleware
    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, response = @app.call(env)

      if text_html?(headers) && env['REQUEST_PATH'] != "/fakebook/cache/store" 
        response.body = response.body.sub!(/<head.*?>/, "\\0 <script id='fakebook-cache'>var win = 'big one'</script>")
        response.body = response.body.sub!(/<\/head.*?>/, "<script src='/assets/fakebook.js'></script> \\0")
      end
      
      [status, headers, response]
    end
        
    def text_html?(headers)
      headers['Content-Type'].try(:split, ';').try(:include?, 'text/html')
    end
  end
end
