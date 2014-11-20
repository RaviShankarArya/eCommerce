require 'rails_helper'

RSpec.describe ProductCategory, :type => :model do
  let(:product_category) {FactoryGirl.create(:product_category)}

  context "Factory settings for product_category" do
    it "should validate the product_category factories" do
      expect(FactoryGirl.create(:product_category).valid?).to be true
    end
  end

  describe ProductCategory do
    it { should validate_presence_of :product_name }
    it { should allow_value('T-Shirt').for(:product_name )}
  end
end
