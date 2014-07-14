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

  def add_access_object
    set_request_user
    set_current_user

    @access_object = AccessObject.find(params[:access_object_id])

    @user.access_objects<<(@access_object)

    if @user.save
      render :show, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def remove_access_object
    set_request_user
    set_current_user

    @access_object = AccessObject.find(params[:id])
    @user.access_objects.delete(@access_object)

    head :no_content

  end

  def create
    @user = User.new(user_params)

    if @user.save
      render :show, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update_attributes(user_params)
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
