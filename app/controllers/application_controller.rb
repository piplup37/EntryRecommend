class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!,:except => :api_render
end
