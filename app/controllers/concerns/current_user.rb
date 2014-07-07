module CurrentUser
  extend ActiveSupport::Concern
  private
  def set_current_user
    if params[:user_id] && (!@user || @user.admin)
      @user = User.find(params[:user_id])
    end
  end

  def set_request_user
    if request.headers['X-RFID']
      @user = User.find_by rfid: request.headers['X-RFID']
    end
  end
end