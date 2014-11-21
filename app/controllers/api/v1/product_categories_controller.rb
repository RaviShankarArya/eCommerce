module Api
  module V1
    class ProductCategoriesController < BaseController
      include ParamsParserHelper

      before_filter :parse_pagination_params, only: :index

      def index
        @proc_code = Proc.new do
          @data = ProductCategory.order("product_name asc").page(@current_page).per(@per_page).all
          @total_data = ProductCategory.count
          @success = true
        end
      end

    end
  end
end