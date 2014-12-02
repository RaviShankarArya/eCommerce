require "rails_helper"
require 'spec_helper'

describe ProductDetailsController, :type => :controller do


let(:product_type) {FactoryGirl.create(:product_type)}
let(:product_detail) {FactoryGirl.create(:product_detail)}


describe "POST create" do

    it "should create product detail" do

     detail_params = {
       product_detail: {
         item_code: "286ea1",
         color: "286ea1",
         price: 1.5,
         stock: 1,
         product_type_id: product_type.id
       }
     }
     post :create, detail_params
     expect(ProductDetail.count).to  eq 1
   end
 end

 describe "GET edit" do
  it "assigns the requested product_detail as @product_detail" do
    get :edit, {:id => product_detail.to_param}
    assigns(:product_detail).should eq(product_detail)
  end
end

describe "PUT update" do
  it "assigns the requested product_detail as @product_detail" do
   put :update, {:id => product_detail.to_param, :product_detail => {"item_code" => "286ea1","color" => "286ea1","price" => 2.5, "stock" => 2, "product_type_id" => product_type.id}}
   assigns(:product_detail).should eq(product_detail)
 end
end

describe "DELETE destroy" do
  it "destroys the requested product_detail" do
    expect do
      delete :destroy, {:id => product_detail.to_param}
      expect(ProductDetail.count).to  eq 1
    end
  end
end

describe "GET index" do
  it "assigns all product_details as @product_details" do
    get :index
    assigns(:product_detail).should eq(@product_detail)
  end
end

end