class PurchasesController < RestController
  include CurrentUser
  before_action :set_current_user

  def index
    @purchases = @user.purchases
  end

  def show
    @purchase = Purchase.find(params[:id])

    if @purchase.user != @user

    end
  end

end