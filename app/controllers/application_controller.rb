class ApplicationController < ActionController::Base
  devise_group :user, contains: [:patient, :doctor]
  before_action :authenticate_user!
end
