class SessionController < ApplicationController
  def new
    @user = User.new
  end

  def lichess_auth
    session[:state] = encode(SecureRandom.uuid)
    session[:code_verifier] = encode(SecureRandom.uuid)
    
    endpoint = 'https://lichess.org/oauth'
    params = {
      response_type: 'code',
      client_id: 'zwischenzug',
      redirect_uri: lichess_redirect_url,
      code_challenge_method: 'S256',
      code_challenge: create_challenge(session[:code_verifier]),
      state: session[:state]
    }
    redirect_to "#{endpoint}?#{URI.encode_www_form(params)}", allow_other_host: true
  end

  def lichess_redirect
    response = HTTParty.post(
      'https://lichess.org/api/token',
      body: {
        grant_type: 'authorization_code',
        code: params[:code],
        client_id: 'zwischenzug',
        redirect_uri: lichess_redirect_url,
        code_verifier: session[:code_verifier]
      }
    )
    p response

    redirect_to new_session_url
  end

  def create
    begin
      @user = User.find_by(name: params[:user][:name])
    rescue Mongoid::Errors::DocumentNotFound
    end

    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash.notice = 'Welcome!'
    else
      flash.alert = 'Unrecognized login'
    end
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def create_challenge(verifier)
    encode(Digest::SHA256.digest(verifier)).rstrip
  end
  
  private

  def encode(s)
    Base64.encode64(s).tr('+/', '-_').gsub('=', '')
  end
end
