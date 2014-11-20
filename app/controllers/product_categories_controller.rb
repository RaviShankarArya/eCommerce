class ProductCategoriesController < BaseController
  # before_filter :require_admin
  # skip_before_filter  :verify_authenticity_token

  before_filter :set_navs, :parse_pagination_params, :only=>:index



  def index

    get_collections

    respond_index(@product_category)
  end


  def show
    ## Creating the health_tip object
    @product_category = ProductCategory.find(params[:id])

    respond(@product_category)
  end

  def new
    ## Intitializing the Health_tip object
    @product_category = ProductCategory.new

    respond(@product_category)
  end

  def edit
    ## Fetching the health_tip object
    @product_category = ProductCategory.find(params[:id])
    respond(@product_category)
  end


  def create
    ## Creating the health_tip object
    @product_category = ProductCategory.new(category_params)
    ## Validating the data
    create_method(@product_category, "Product Category", "product_category_url")
  end


  def update
    ## Fetching the health_tip
    @product_category = ProductCategory.find(params[:id])
    ## Updating the @health_tip object with params
    @product_category.assign_attributes(category_params)

    ## Validating the data
    update_method(@product_category, "Product Category", "product_category_url")
  end

  def destroy
    ## Fetching the health_tip
    @product_category = ProductCategory.find(params[:id])

    respond_to do |format|
      ## Destroying the health_tip
      @product_category.destroy
      @product_category = ProductCategory.new

      # Fetch the health_tip to refresh ths list and details box
      get_collections
      @product_category = @product_categories.first if @product_categories and @product_categories.any?

      # Setting the flash message
      message = translate("forms.destroyed_successfully", :item => "Product Category")
      store_flash_message(message, :success)

      format.html {
        redirect_to product_categories_url notice: message
      }
      format.json { head :no_content }
      format.js {}

    end
  end


  private

  def set_navs
    set_nav("Manage Product Category")
  end

def get_collections

    # Fetching the health_tips
    relation = ProductCategory.where("")
    @filters = {}

    if params[:query]
      @query = params[:query].strip
      relation = relation.search(@query) if !@query.blank?
    end

    @product_categories = relation.order("created_at desc").page(@current_page).per(@per_page)


    ## Initializing the @health_tip object so that we can render the show partial
    @product_category = @product_categories.first unless @product_category
    return true

  end

  def category_params
    params.require(:product_category).permit(:product_name)
  end



end