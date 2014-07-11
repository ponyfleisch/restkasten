class AccessesController < RestController
  include CurrentUser
  before_action :set_request_user
  before_action :set_current_user

  def index
    @accesses = @user.accesses
  end

  def show
    @access = Access.find(params[:id])

    if @access.user != @user

    end
  end

  def create
    @access = Access.new(access_params)

    @access.user = @user
    
    if (@user.access_objects.include?(AccessObject.find(params[:access_object_id]))) || (params[:onoff] == '0')
      @access.success = true
    else
      @access.success = false
    end

    if @access.save
      render :show, status: :created, location: @access
    else
      render json: @access.errors, status: :unprocessable_entity
    end
  end

  private
  def access_params
    params.permit(:access_object_id, :onoff)
  end



end