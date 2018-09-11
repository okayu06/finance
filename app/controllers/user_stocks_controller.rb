class UserStocksController < ApplicationController
  
  def create
    #tableから探す。
    stock = Stock.find_by_ticker(params[:stock_ticker])
    if stock.blank?
      #webから探す。初めて記入されるものなら、tableにStockdataがない。
      stock = Stock.new_from_lookup(params[:stock_ticker])
      stock.save
    end 
    @user_stock = UserStock.create(user: current_user, stock: stock)
    flash[:success] = "Stock #{@user_stock.stock.name} was successfully added to portfolio"
    redirect_to my_portofolio_path
  end  
end
