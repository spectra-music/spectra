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
    sse.write({ path: params[:q]}, event: 'message')
    sse.close
  rescue IOError
    # ignored
  ensure
    sse.close
  end
end