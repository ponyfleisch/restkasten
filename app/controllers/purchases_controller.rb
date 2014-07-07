class PurchasesController < RestController
  include CurrentUser
  before_action :set_request_user
  before_action :set_current_user

  def index
    @purchases = @user.purchases
  end

  def show
    @purchase = Purchase.find(params[:id])

    if @purchase.user != @user

    end
  end

  def create
    @purchase = Purchase.new(purchase_params)

    @purchase.user = @user

    if @purchase.save
      render :show, status: :created, location: @purchase
    else
      render json: @purchase.errors, status: :unprocessable_entity
    end
  end

  private
  def purchase_params
    params.permit(:amount)
  end



end