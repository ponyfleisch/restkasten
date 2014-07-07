class RestController < ApplicationController
  before_filter :set_default_response_format
  skip_before_action :verify_authenticity_token

  private
  def set_default_response_format
    request.format = :json
  end
end