require "rails_helper"
require 'spec_helper'

describe Api::V1::ProductDetailsController, :type => :controller do
  include ParamsParserHelper
  describe "GET #Product_details" do
    let(:product_detail_one){FactoryGirl.create(:product_detail)}
    let(:product_detail_two){FactoryGirl.create(:product_detail)}
    let(:product_detail_three){FactoryGirl.create(:product_detail)}

    it "should return a list of product_details" do
      [product_detail_one, product_detail_two, product_detail_three]


      get :index
      @data = ProductDetail.order("id asc").page(@current_page).per(@per_page).all

      expect(assigns[:data]).to match_array(@data)
    end
  end
end