module Api
  module V1
    class ProductDetailsController < BaseController
      include ParamsParserHelper

      before_filter :parse_pagination_params, only: :index

      def index
        @proc_code = Proc.new do
          @data = ProductDetail.order("id asc").page(@current_page).per(@per_page).all
          @total_data = ProductDetail.count
          @success = true
        end
      end

    end
  end
end