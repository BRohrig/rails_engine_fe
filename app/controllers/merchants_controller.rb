class MerchantsController < ApplicationController
  def index
    @merchants = MerchantsFacade.get_merchants
  end
end