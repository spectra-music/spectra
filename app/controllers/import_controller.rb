class ImportController < ApplicationController
  include ActionController::Live

  # GET /import
  # GET /import.json
  def index
  end

  # GET /import/add
  def add
    js false
    response.headers['Content-Type'] = 'text/event-stream'
    sse = SSE.new(response.stream)
    sse.write({}, event: 'close') # close the client side
  rescue IOError
    # ignored
  ensure
    sse.close
  end
end