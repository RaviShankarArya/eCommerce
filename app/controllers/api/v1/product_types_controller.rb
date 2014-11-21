module Api
  module V1
    class ProductTypesController < BaseController
      include ParamsParserHelper

      before_filter :parse_pagination_params, only: :index

      def index
        @proc_code = Proc.new do
          @data = ProductType.order("product_type_name asc").page(@current_page).per(@per_page).all
          @total_data = ProductType.count
          @success = true
        end
      end

    end
  end
end