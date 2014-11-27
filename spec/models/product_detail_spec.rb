require 'rails_helper'

RSpec.describe ProductDetail, :type => :model do

let(:product_detail) {FactoryGirl.create(:product_detail)}

context "Factory settings for product_details" do
    it "should validate the product_details factories" do
      expect(FactoryGirl.create(:product_detail).valid?).to be true
    end
  end

  describe ProductDetail do
    it { should validate_presence_of :item_code }
    it { should allow_value('286ea1').for(:item_code )}
    it { should validate_presence_of :color }
    it { should allow_value('286ea1').for(:color )}
    it { should validate_presence_of :price }
    it { should validate_presence_of :stock }

  end

end
