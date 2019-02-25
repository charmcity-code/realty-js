class BuyersController < ApplicationController

  def index
    @buyers = Buyer.all
  end

  def new
    @buyer = Buyer.new
  end

  def create
    @buyer = Buyer.new(buyer_params)

    if @buyer.save
      redirect_to buyer_path(@buyer)
    else
      render new_buyer_path
    end
  end

  def edit
    @buyer = Buyer.find_by(id: params[:id])
  end

  def update
    @buyer = Buyer.find_by(id: params[:id])
    @buyer.update(buyer_params)
    redirect_to buyer_path(@buyer)
  end

  def show
    @buyer = Buyer.find_by(id: params[:id])
  end

  def destroy
    Buyer.find(params[:id]).destroy
    flash[:notice] = "Buyer deleted"
    redirect_to buyers_path
  end

  private

  def buyer_params
    params.require(:buyer).permit(:name, :email)
  end
end
