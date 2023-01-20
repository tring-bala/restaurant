class Admin::RestaurantsController < Admin::BaseController
  before_action :set_restaurant, only: %i[ show edit update destroy ]

  # GET /restaurants or /restaurants.json
  def index
    @restaurants = Restaurant.page(params[:page]).per(params[:per_page])
  end

  # GET /restaurants/1 or /restaurants/1.json
  def show
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
    @branch = @restaurant.branches.build(is_head_branch: true)
  end

  # GET /restaurants/1/edit
  def edit
    @branch = @restaurant.branches.where(is_head_branch: true)
    @branch = @restaurant.branches.build(is_head_branch: true) if @branch.blank?
  end

  # POST /restaurants or /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to admin_restaurants_url, notice: "Restaurant was successfully created." }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1 or /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to admin_restaurants_url, notice: "Restaurant was successfully updated." }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1 or /restaurants/1.json
  def destroy
    @restaurant.destroy

    respond_to do |format|
      format.html { redirect_to admin_restaurants_url, notice: "Restaurant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :number, :website, :contact_person, :contact_number, :email, :owner_id, branches_attributes: [:id, :name, :is_head_branch, {address_attributes: [:id, :building_number, :street, :locality, :landmark, :city, :state, :pincode, :_destroy]}, :_destroy])
    end
end
