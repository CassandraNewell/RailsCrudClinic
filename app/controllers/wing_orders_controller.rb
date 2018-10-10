class WingOrdersController < ApplicationController
  def index
    @wing_orders = WingOrder.all
  end

  def new
    @wing_order = WingOrder.new
    @quantity_collection = WingOrder::QUANTITIES
  end

  def create
    @wing_order = WingOrder.new(wing_order_params)
    if @wing_order.save
      flash[:notice] = "Wing order created!"
      redirect_to wing_orders_path
    else
      flash[:alert] = "Wing order not created"
      @quantity_collection = WingOrder::QUANTITIES
      render :new
    end
  end

  private

  def wing_order_params
    params.require(:wing_order).permit(
      :customer_name,
      :city,
      :quantity,
      :ranch_dressing
    )
  end
end
