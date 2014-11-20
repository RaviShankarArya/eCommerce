require 'rails_helper'

RSpec.describe ProductType, :type => :model do
let(:product_type) {FactoryGirl.create(:product_type)}

context "Factory settings for product_type" do
    it "should validate the product_type factories" do
      expect(FactoryGirl.create(:product_type).valid?).to be true
    end
  end

  describe ProductType do
    it { should validate_presence_of :product_type_name }
    it { should allow_value('Shirt').for(:product_type_name )}
  end
end
