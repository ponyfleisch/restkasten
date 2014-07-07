class RestController < ApplicationController
  before_filter :set_default_response_format
  skip_before_action :verify_authenticity_token
  rescue_from Exception, :with => :access_error

  private
  def set_default_response_format
    request.format = :json
  end

  def access_error
    render :nothing => true, :status => 403
  end

end