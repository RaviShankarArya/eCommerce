require "rails_helper"
require 'spec_helper'

describe Api::V1::ProductTypesController, :type => :controller do
  include ParamsParserHelper
  describe "GET #Product_types" do
    let(:product_type_one){FactoryGirl.create(:product_type)}
    let(:product_type_two){FactoryGirl.create(:product_type)}
    let(:product_type_three){FactoryGirl.create(:product_type)}

    it "should return a list of product_types" do
      [product_type_one, product_type_two, product_type_three]


      get :index
      @data = ProductType.order("product_type_name asc").page(@current_page).per(@per_page).all

      expect(assigns[:data]).to match_array(@data)
    end
  end
end