class ListingsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :check_auth, except: [:search]
  before_action :set_listing, only: %i[show request_listing seller edit update destroy]
  before_action :set_page, only: %i[index seller search]
  before_action :set_categories, only: %i[new create search categories edit]

  LISTINGS_PER_PAGE = 4

  # GET /listings or /listings.json
  def index
    @listings = Listing.offset(@page * LISTINGS_PER_PAGE).limit(LISTINGS_PER_PAGE)
  end

  # GET /listings/1 or /listings/1.json
  def show
    @requested = 0
    @user = @listing.user
    @email = @listing.user.email
  end

  # Sends an email to the @listing.user's email and re-renders the page to hide the notification button.
  def request_listing
    RequestMailer.requested_listing(@listing).deliver_now
    flash.now[:notice] = "A request email has been sent to this user!"
    render 'show'
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

    # before_save :method
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
        @listings = Listing.where("name like ?", "%#{params[:query].titleize}%")
      when "category"
        @listings = []
        @categories = Category.where("name like ?", "%#{params[:query].titleize}%")

        @categories.each do |cat|
          cat.listings.each do |list|
            @listings << list
          end
        end
      end
      render 'index'
  end


  def categories
    #eager loading listings for each category
    @categories = Category.includes(:listings)
    
  end

  def seller
    @seller = @listing.user
    @listings = @seller.listings
    @listings = @listings.offset(@page * LISTINGS_PER_PAGE).limit(LISTINGS_PER_PAGE)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
      @listings = Listing.all
    end

    def set_categories
      @categories = Category.all
    end

    def set_page
      @page = params.fetch(:page, 0).to_i
    end

    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:name, :description, :price, :plant_picture)
    end

    def check_auth
      authorize Listing
    end
end
