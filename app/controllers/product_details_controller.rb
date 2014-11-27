class ProductDetailsController < BaseController

  before_filter :set_navs, :parse_pagination_params, :only=>:index
  skip_before_filter  :verify_authenticity_token

  def index

     get_collections

    respond_index(@product_deatil)
  end

  def show
    ## Creating the health_tip object
    @product_detail = ProductDetail.find(params[:id])

    respond(@product_detail)
  end

  def new
    ## Intitializing the Health_tip object
    @product_detail = ProductDetail.new

    respond(@product_detail)
  end

  def edit
    ## Fetching the health_tip object
    @product_detail = ProductDetail.find(params[:id])
    respond(@product_detail)
  end

  def create
    ## Creating the health_tip object
    @product_detail = ProductDetail.new(detail_params)
    ## Validating the data
    create_method(@product_detail, "Product Detail", "product_detail_url")
  end

  def update
    ## Fetching the health_tip
    @product_detail = ProductDetail.find(params[:id])
    ## Updating the @health_tip object with params
    @product_detail.assign_attributes(detail_params)

    ## Validating the data
    update_method(@product_detail, "Product Detail", "product_detail_url")
  end

  def destroy
    ## Fetching the health_tip
    @product_detail = ProductDetail.find(params[:id])

    respond_to do |format|
      ## Destroying the health_tip
      @product_detail.destroy
      @product_detail = ProductDetail.new

      # Fetch the health_tip to refresh ths list and details box
      get_collections
      @product_detail = @product_details.first if @product_details and @product_details.any?

      # Setting the flash message
      message = translate("forms.destroyed_successfully", :item => "Product Detail")
      store_flash_message(message, :success)

      format.html {
        redirect_to product_details_url notice: message
      }
      format.json { head :no_content }
      format.js {}

    end
  end

  private

  def set_navs
    set_nav("Manage Product Details")
  end

  def get_collections

    # Fetching the health_tips
    relation = ProductDetail.where("")
    @filters = {}

    if params[:query]
      @query = params[:query].strip
      relation = relation.search(@query) if !@query.blank?
    end

    @product_details = relation.order("created_at desc").page(@current_page).per(@per_page)


    ## Initializing the @health_tip object so that we can render the show partial
    @product_detail = @product_details.first unless @product_detail
    return true

  end

  def detail_params
    params.require(:product_detail).permit(:item_code, :color, :price, :stock, :product_type_id)
  end

end