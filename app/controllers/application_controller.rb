class ApplicationController < ActionController::API
  include Authentication

  before_action :authorize
end
