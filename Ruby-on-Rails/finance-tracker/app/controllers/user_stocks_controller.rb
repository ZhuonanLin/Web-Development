class UserStocksController < ApplicationController
  def create
    stock = Stock.find_by_ticker(params[:stock_ticker])
    if stock.blank?
      stock = Stock.new_from_lookup(params[:stock_ticker])
      stock.save
    end
  @user_stock = UserStock.new(user: current_user, stock: stock)
  flash[:success] = "Stock #{@user_stock.stock.name} has been successfully add to your portfolio!"
  end
  
  def destroy
    stock = Stock.find(params[:id])
    @user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first
    @user_stock.destroy
    
    flash[:notice] = "Stock has been successfully removed from your portfilio"
    redirect_to my_portfolio_path
    
  end
end
