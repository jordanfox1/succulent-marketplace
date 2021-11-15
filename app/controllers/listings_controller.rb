class ListingsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :check_auth, except: [:search]
  before_action :set_listing, only: %i[show seller edit update destroy]

  # GET /listings or /listings.json
  def index
    @listings = Listing.all
  end

  # GET /listings/1 or /listings/1.json
  def show
    @user = @listing.user
    @email = @listing.user.email

    RequestMailer.requested_listing(@listing).deliver_now

  end

  # GET /listings/new
  def new
    @listing = current_user.listings.build
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings or /listings.json
  def create
    @listing = current_user.listings.build(listing_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: "Listing was successfully created." }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1 or /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to @listing, notice: "Listing was successfully updated." }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1 or /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to listings_url, notice: "Listing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def search
    case params[:type]
    when "name"
      @listings = Listing.where("name like ?", "%#{params[:query].capitalize}%")
    when "category"
      @listings = []
      @categories = Category.where("name like ?", "%#{params[:query].capitalize}%")

      @categories.each do |cat|
        cat.listings.each do |list|
          @listings << list
        end
      end
    end
    render 'index'
  end

  def categories
    @categories = Category.all
  end

  def seller
    @seller = @listing.user
    @listings = @seller.listings
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
      @listings = Listing.all
    end

    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:name, :description, :price, :plant_picture)
    end

    def check_auth
      authorize Listing
    end
end
