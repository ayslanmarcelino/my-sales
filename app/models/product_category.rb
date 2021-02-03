# == Schema Information
#
# Table name: product_categories
#
#  id            :bigint           not null, primary key
#  description   :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  enterprise_id :bigint           not null
#
# Indexes
#
#  index_product_categories_on_enterprise_id  (enterprise_id)
#
# Foreign Keys
#
#  fk_rails_...  (enterprise_id => enterprises.id)
#
class ProductCategory < ApplicationRecord
  belongs_to :enterprise
  validates_presence_of %i[description]
end
