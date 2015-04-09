require 'sinatra'

class App < Sinatra::Base

  get '/' do
    response.headers["Transfer-Encoding"] = "chunked"
    async = env['java.servlet_request'].start_async

    Thread.new do
      sleep 10 # something that takes a long time
      async.response.output_stream.println("<p>Asynchronous thing!</p>")
      async.complete
    end

    "<p>Synchronous part!</p>"
  end
end

run App
