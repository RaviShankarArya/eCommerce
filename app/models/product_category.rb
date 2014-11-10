class ProductCategory < ActiveRecord::Base
  validates :product_name, presence: true,
  :format => {:with => ConfigCenter::GeneralValidations::PRODUCT_FORMAT_REG_EXP}
end
