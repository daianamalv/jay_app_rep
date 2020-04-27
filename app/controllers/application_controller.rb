class ApplicationController < ActionController::Base
  # before_action :authenticate_guide!
  def index
    @user = User.first
  end
end
