class AdminController < ApplicationController
  def index

  end

  def template
    render action: params[:name], layout: false
  end
end