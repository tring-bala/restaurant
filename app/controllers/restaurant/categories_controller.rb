class Restaurant::CategoriesController < Restaurant::BaseController
  before_action :set_category, only: %i[ show edit update destroy ]

  # GET /restaurant/categories or /restaurant/categories.json
  def index
    @categories = Category.page(params[:page]).per(params[:per_page])
  end

  # GET /restaurant/categories/1 or /restaurant/categories/1.json
  def show
  end

  # GET /restaurant/categories/new
  def new
    @category = Category.new
  end

  # GET /restaurant/categories/1/edit
  def edit
  end

  # POST /restaurant/categories or /restaurant/categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to restaurant_categories_url, notice: "Category was successfully created." }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurant/categories/1 or /restaurant/categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to restaurant_categories_url, notice: "Category was successfully updated." }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurant/categories/1 or /restaurant/categories/1.json
  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to restaurant_categories_url, notice: "Category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name)
    end
end
