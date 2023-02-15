class MerchantsController < ApplicationController
  def index
    @merchants = MerchantsFacade.get_merchants
  end

  def show
    @merchant = MerchantsFacade.find_merchant(params[:id])
    @items = MerchantsFacade.find_items(@merchant.id)
  end
end