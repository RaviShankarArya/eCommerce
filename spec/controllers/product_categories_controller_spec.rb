require "rails_helper"
require 'spec_helper'

describe ProductCategoriesController, :type => :controller do

  let(:product_category) {FactoryGirl.create(:product_category)}


  describe "POST create" do

    it "should create product category" do

     category_params = {
       product_category: {
         product_name: "T-Shirt"
       }
     }
     post :create, category_params
     expect(ProductCategory.count).to  eq 1
   end
 end

 describe "GET edit" do
  it "assigns the requested product_category as @product_category" do
    get :edit, {:id => product_category.to_param}
    assigns(:product_category).should eq(product_category)
  end
end

describe "PUT update" do
  it "assigns the requested product_category as @product_category" do
   put :update, {:id => product_category.to_param, :product_category => {"product_name" => "Shirt"}}
     assigns(:product_category).should eq(product_category)
   end
 end

 describe "DELETE destroy" do
  it "destroys the requested product_category" do
    expect do
      delete :destroy, {:id => product_category.to_param}
      expect(ProductCategory.count).to  eq 1
    end
  end
end

describe "GET index" do
  it "assigns all staffs as @product_category" do
    get :index
    assigns(:product_category).should eq(@product_category)
  end
end
  end