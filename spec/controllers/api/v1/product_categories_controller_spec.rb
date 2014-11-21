require "rails_helper"
require 'spec_helper'

describe Api::V1::ProductCategoriesController, :type => :controller do

  describe "GET #Health_tip" do
      let(:product_category_one){FactoryGirl.create(:product_category)}
      let(:product_category_two){FactoryGirl.create(:product_category)}
      let(:product_category_three){FactoryGirl.create(:product_category)}

    it "should return a list of Health_tip" do
      [product_category_one, product_category_two, product_category_three]

      @current_page = 1
      @per_page = ConfigCenter::Defaults::ITEMS_PER_LIST
      get :index
      @data = ProductCategory.order("product_name asc").page(@current_page).per(@per_page).all

      expect(assigns[:data]).to match_array(@data)
    end
  end
end