class Restaurant::IngredientsController < Restaurant::BaseController
  before_action :set_ingredient, only: %i[ show edit update destroy ]

  # GET /restaurant/ingredients or /restaurant/ingredients.json
  def index
    @ingredients = Ingredient.page(params[:page]).per(params[:per_page])
  end

  # GET /restaurant/ingredients/1 or /restaurant/ingredients/1.json
  def show
  end

  # GET /restaurant/ingredients/new
  def new
    @ingredient = Ingredient.new
  end

  # GET /restaurant/ingredients/1/edit
  def edit
  end

  # POST /restaurant/ingredients or /restaurant/ingredients.json
  def create
    @ingredient = Ingredient.new(ingredient_params)

    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to restaurant_ingredients_url, notice: "Ingredient was successfully created." }
        format.json { render :show, status: :created, location: @ingredient }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurant/ingredients/1 or /restaurant/ingredients/1.json
  def update
    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to restaurant_ingredients_url, notice: "Ingredient was successfully updated." }
        format.json { render :show, status: :ok, location: @ingredient }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurant/ingredients/1 or /restaurant/ingredients/1.json
  def destroy
    @ingredient.destroy

    respond_to do |format|
      format.html { redirect_to restaurant_ingredients_url, notice: "Ingredient was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ingredient_params
      params.require(:ingredient).permit(:name, :unit, sub_ingredients_attributes: [:id, :name, :unit, :quantity, :_destroy])
    end
end
