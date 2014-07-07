class AccessObjectsController < RestController
  include CurrentUser
  before_action :set_request_user
  before_action :set_current_user

  def index
    @access_objects = AccessObject.all
  end

  def show
    @access_object = AccessObject.find(params[:id])
  end

  def create
    @access_object = AccessObject.new(access_object_params)

    if @access_object.save
      render :show, status: :created, location: @access_object
    else
      render json: @access_object.errors, status: :unprocessable_entity
    end
  end

  private
  def access_object_params
    params.permit(:name)
  end



end