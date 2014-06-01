class ImportController < ApplicationController
  include ActionController::Live

  # GET /import
  # GET /import.json
  def index
    render 'index'
  end

  # GET /import/add?path=
  def add
    js false
    response.headers['Content-Type'] = 'text/event-stream'
    sse = SSE.new(response.stream)
    4.times do
      sse.write(path: params[:path])
      sleep 2
    end
    sse.write({}, event: 'close') # close the client side
  rescue IOError
    # ignored
  ensure
    sse.close
  end
end
