class Restaurant::MenusController < Restaurant::BaseController
    before_action :set_menu, only: %i[ show edit update destroy ]

    def index
      @menus = Menu.page(params[:page]).per(params[:per_page])
    end

  def new
    @menu = Menu.new
  end

  def create
    @menu = current_restaurant.menus.new(menu_params)

    respond_to do |format|
      if @menu.save
        format.html { redirect_to restaurant_menus_url, notice: "Menu was successfully created." }
        format.json { render :show, status: :created, location: @ingredient }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

    def update
    respond_to do |format|
      if @menu .update(menu_params)
        format.html { redirect_to restaurant_menus_url, notice: "Menu was successfully updated." }
        format.json { render :show, status: :ok, location: @menu }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @menu.destroy

    respond_to do |format|
      format.html { redirect_to restaurant_menus_url, notice: "Menu was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def menu_params
    params.require(:menu).permit(:name, :menu_code, :image_url, :description, :price)
  end
end