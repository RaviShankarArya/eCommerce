class ProductTypesController < BaseController

  before_filter :set_navs, :parse_pagination_params, :only=>:index
  skip_before_filter  :verify_authenticity_token


  def index

    get_collections

    respond_index(@product_type)
  end

  def show
    ## Creating the health_tip object
    @product_type = ProductType.find(params[:id])

    respond(@product_type)
  end

def new
    ## Intitializing the Health_tip object
    @product_type = ProductType.new

    respond(@product_type)
  end

  def edit
    ## Fetching the health_tip object
    @product_type = ProductType.find(params[:id])
    respond(@product_type)
  end

  def create
    ## Creating the health_tip object
    @product_type = ProductType.new(type_params)
    @product_categories = ProductCategory.all
    ## Validating the data
    create_method(@product_type, "Product Type", "product_type_url")
  end

  def update
    ## Fetching the health_tip
    @product_type = ProductType.find(params[:id])
    ## Updating the @health_tip object with params
    @product_type.assign_attributes(type_params)

    ## Validating the data
    update_method(@product_type, "Product Type", "product_type_url")
  end

  def destroy
    ## Fetching the health_tip
    @product_type = ProductType.find(params[:id])

    respond_to do |format|
      ## Destroying the health_tip
      @product_type.destroy
      @product_type = ProductType.new

      # Fetch the health_tip to refresh ths list and details box
      get_collections
      @product_type = @product_types.first if @product_types and @product_types.any?

      # Setting the flash message
      message = translate("forms.destroyed_successfully", :item => "Product Type")
      store_flash_message(message, :success)

      format.html {
        redirect_to product_types_url notice: message
      }
      format.json { head :no_content }
      format.js {}

    end
  end

  private

  def set_navs
    set_nav("Manage Product Types")
  end

  def get_collections

    # Fetching the health_tips
    relation = ProductType.where("")
    @filters = {}

    if params[:query]
      @query = params[:query].strip
      relation = relation.search(@query) if !@query.blank?
    end

    @product_types = relation.order("created_at desc").page(@current_page).per(@per_page)


    ## Initializing the @health_tip object so that we can render the show partial
    @product_type = @product_types.first unless @product_type
    return true

  end

  def type_params
    params.require(:product_type).permit(:product_type_name,:product_category_id)
  end

end
