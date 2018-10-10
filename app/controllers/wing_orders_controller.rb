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

  def edit
    @wing_order = WingOrder.find(params[:id])
    @quantity_collection = WingOrder::QUANTITIES
  end

  def update
    @wing_order = WingOrder.find(params[:id])

    if @wing_order.update_attributes(wing_order_params)
      flash[:notice] = "Wing order updated!"
      redirect_to wing_orders_path
    else
      flash[:alert] = "Wing order not updated"
      @quantity_collection = WingOrder::QUANTITIES
      render :edit
    end
  end

  def destroy
    @wing_order = WingOrder.find(params[:id])
    @wing_order.destroy

    redirect_to wing_orders_path
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
