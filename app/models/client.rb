# == Schema Information
#
# Table name: clients
#
#  id               :bigint           not null, primary key
#  document_number  :string           not null
#  email            :string
#  first_name       :string           not null
#  last_name        :string           not null
#  nickname         :string
#  phone_number     :string
#  telephone_number :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  enterprise_id    :bigint           not null
#
# Indexes
#
#  index_clients_on_enterprise_id  (enterprise_id)
#
# Foreign Keys
#
#  fk_rails_...  (enterprise_id => enterprises.id)
#
class Client < ApplicationRecord
  belongs_to :enterprise
end
