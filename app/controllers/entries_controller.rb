class EntriesController < RestController
  include CurrentUser
  before_action :set_current_user

  def index
    @entries = @user.entries
  end

  def show
    @entry = Entry.find(params[:id])

    if @entry.user != @user

    end
  end
end