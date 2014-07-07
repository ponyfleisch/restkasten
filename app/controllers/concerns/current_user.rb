module CurrentUser
  extend ActiveSupport::Concern
  private
  def set_current_user
    @user = User.find(params[:user_id])
  end
end