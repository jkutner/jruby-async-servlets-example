require 'sinatra'

class App < Sinatra::Base

  get '/' do
    response.headers["Transfer-Encoding"] = "chunked"
    async = env['java.servlet_request'].startAsync

    Thread.new do
      sleep 10
      async.getResponse.getOutputStream.println("<p>Background thing!</p>")
      async.getResponse.getOutputStream.flush
      async.complete
    end

    "<p>Synchronous part!</p>"
  end

  run! if app_file == $0
end

run App
