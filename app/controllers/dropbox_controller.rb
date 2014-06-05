class DropboxController < ApplicationController
  def authorize
    consumer = Dropbox::API::OAuth.consumer(:authorize)
    request_token = consumer.get_request_token
    session[:request_token] = request_token.token
    session[:request_token_secret] = request_token.secret

    redirect_to request_token.authorize_url({
      oauth_token: session[:request_token],
      oauth_callback: url_for(:dropbox_callback)
    })
  end

  def callback
    consumer = Dropbox::API::OAuth.consumer(:authorize)
    request_token = OAuth::RequestToken.new(consumer, session[:request_token], session[:request_token_secret])

    access_token = request_token.get_access_token(oauth_verifier: params[:oauth_token])

    session[:access_token] = access_token.token
    session[:access_secret] = access_token.secret

    # redirect_to ...
  end
end
