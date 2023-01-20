class Restaurant::BranchesController < Restaurant::BaseController
  
  before_action :set_branch, only: %i[ show edit update destroy ]
  def index
    @branches = Branch.page(params[:page]).per(params[:per_page])
  end
  
  def new
    @branch = Branch.new
  end

  def show
  end
  
  def create
    @branch = Branch.new(branch_params)

    respond_to do |format|
      if @branch.save
        format.html { redirect_to restaurant_branches_url, notice: "Branch was successfully created." }
        format.json { render :show, status: :created, location: @branch }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_branch
        @branch = Branch.find(params[:id])
    end

      # Only allow a list of trusted parameters through.
    def branch_params
      params.require(:branch).permit(:name, :number, :is_head_branch, :contact_person, :contact_name, :email, :owner_id)
    end
end
