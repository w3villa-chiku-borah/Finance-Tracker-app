class UsersController < ApplicationController
  def my_portfolio
    @track_stock = current_user.stocks
    
  end
end
