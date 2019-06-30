class StocksController < ApplicationController
  def search
    if params[:stock].blank?
      flash.now[:danger] = "You have entered an empty string for searching!"\
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "The symbol you entered is not in database!" unless @stock
    end
    render partial: 'users/result'
  end
  
end