class ProductDetail < ActiveRecord::Base
  belongs_to :product_type

  validates :item_code, presence: true,
  :format => {:with => ConfigCenter::GeneralValidations::ITEM_CODE_FORMAT_REG_EXP}

  validates :color, presence: true,
  :format => {:with => ConfigCenter::GeneralValidations::COLOR_FORMAT_REG_EXP}

  validates :price, presence: true,
  :format => {:with => ConfigCenter::GeneralValidations::PRICE_FORMAT_REG_EXP}

  validates :stock, presence: true,
  :format => {:with => ConfigCenter::GeneralValidations::STOCK_FORMAT_REG_EXP}
end
