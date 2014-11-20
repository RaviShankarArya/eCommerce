class ProductType < ActiveRecord::Base
  belongs_to :product_category

  validates :product_type_name, presence: true,
  :format => {:with => ConfigCenter::GeneralValidations::PRODUCT_TYPE_FORMAT_REG_EXP}
end
