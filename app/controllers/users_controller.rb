class UsersController < RestController
  include CurrentUser

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def show_me
    set_request_user
    render :show
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render :show, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end


  private
  def user_params
    params.permit(:name, :password, :admin, :rfid)
  end


end
