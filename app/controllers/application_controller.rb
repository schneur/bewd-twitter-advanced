class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    token = cookies.signed[:twitter_session_token]
    session = Session.find_by(token: token)
    session.user
  end
end
