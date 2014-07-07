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

  def access_objects
    set_request_user
    set_current_user
    @access_objects = @user.access_objects
  end

  def access_object
    set_request_user
    set_current_user

    @access_object = @user.access_objects.find(params[:id])
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
