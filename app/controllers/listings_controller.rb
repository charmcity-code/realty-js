class ListingsController < ApplicationController

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)

    if @listing.save
      redirect_to listing_path(@listing)
    else
      render new_listing_path
    end
  end

  def index
    @listings = Listing.all
    respond_to do |f|
			f.html {render :index}
			f.json {render json: @listings}
		end
  end

  def show
    @listing = Listing.find_by(id: params[:id])
  end

  def edit
    @listing = Listing.find_by(id: params[:id])
  end

  def update
    @listing = Listing.find_by(id: params[:id])
    @listing.update(listing_params)
    redirect_to listing_path(@listing)
  end

  def destroy
    Listing.find(params[:id]).destroy
    flash[:notice] = "Listing deleted"
    redirect_to listings_path
  end

  private

  def listing_params
    params.require(:listing).permit(:street, :city, :state, :zip_code, :property_type, :bedrooms, :bathrooms, :list_price, :user_id)
  end
end
