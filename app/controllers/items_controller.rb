class ItemsController < ApplicationController
  def index
    @items = ItemsFacade.get_items
  end

  def show
    @item = ItemsFacade.find_item(params[:id])
    @merchant = MerchantsFacade.find_merchant(@item.merchant_id)
  end


end