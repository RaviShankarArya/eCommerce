require 'rails_helper'

RSpec.describe ProductDetail, :type => :model do

let(:product_detail) {FactoryGirl.create(:product_detail)}

context "Factory settings for product_details" do
    it "should validate the product_details factories" do
      expect(FactoryGirl.create(:product_detail).valid?).to be true
    end
  end

end
