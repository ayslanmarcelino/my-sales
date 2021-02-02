# == Schema Information
#
# Table name: providers
#
#  id               :bigint           not null, primary key
#  company_name     :string
#  document_number  :string
#  email            :string
#  fantasy_name     :string
#  observation      :string
#  phone_number     :string
#  responsible      :string
#  telephone_number :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  enterprise_id    :bigint           not null
#
# Indexes
#
#  index_providers_on_enterprise_id  (enterprise_id)
#
# Foreign Keys
#
#  fk_rails_...  (enterprise_id => enterprises.id)
#
class Provider < ApplicationRecord
  belongs_to :enterprise
  validates :document_number, uniqueness: { scope: :enterprise_id }
  validates_presence_of %i[company_name fantasy_name document_number email responsible
                           enterprise_id]
end
