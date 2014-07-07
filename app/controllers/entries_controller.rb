class EntriesController < RestController
  include CurrentUser
  before_action :set_request_user
  before_action :set_current_user

  def index
    @entries = @user.entries
  end

  def show
    @entry = Entry.find(params[:id])

    if @entry.user != @user

    end
  end

  def create
    @entry = Entry.new(entry_params)

    @entry.user = @user

    if @entry.save
      render :show, status: :created, location: @entry
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  private
  def entry_params
    params.permit(:door)
  end



end