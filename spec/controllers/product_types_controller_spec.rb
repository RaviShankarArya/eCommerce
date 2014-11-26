require "rails_helper"
require 'spec_helper'

describe ProductTypesController, :type => :controller do
  let(:product_category) {FactoryGirl.create(:product_category)}
  let(:product_type) {FactoryGirl.create(:product_type)}

  describe "POST create" do

    it "should create product type" do

     type_params = {
       product_type: {
         product_type_name: "Shirt",
         product_category_id: product_category.id
       }
     }
     post :create, type_params
     expect(ProductType.count).to  eq 1
   end
 end

 describe "GET edit" do
  it "assigns the requested product_type as @product_type" do
    get :edit, {:id => product_type.to_param}
    assigns(:product_type).should eq(product_type)
  end
end

describe "PUT update" do
  it "assigns the requested product_type as @product_type" do
   put :update, {:id => product_type.to_param, :product_type => {"product_type_name" => "Shirt", "product_category_id" => product_category.id}}
   assigns(:product_type).should eq(product_type)
 end
end

describe "DELETE destroy" do
  it "destroys the requested product_type" do
    expect do
      delete :destroy, {:id => product_type.to_param}
      expect(ProductType.count).to  eq 1
    end
  end
end

describe "GET index" do
  it "assigns all product_type as @product_type" do
    get :index
    assigns(:product_type).should eq(@product_type)
  end
end
end