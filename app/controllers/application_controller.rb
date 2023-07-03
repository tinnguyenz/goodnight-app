class ApplicationController < ActionController::API
  before_action :create_myself

  private

  def create_myself
    unless session[:current_user_id]
      user = User.create(name: "Myself")
      session[:current_user_id] = user.id
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id])
  end

  def session
    request.session
  end

  def self.current_user
    before_action do
      @current_user ||= User.find_by(id: session[:current_user_id])
    end
  end
end
