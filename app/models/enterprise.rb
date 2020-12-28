# == Schema Information
#
# Table name: enterprises
#
#  id              :bigint           not null, primary key
#  company_name    :string           not null
#  document_number :string           not null
#  email           :string           not null
#  fantasy_name    :string           not null
#  opening_date    :date             not null
#  primary_color   :string           not null
#  secondary_color :string           not null
#  slug            :string
#  uuid            :uuid             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_enterprises_on_document_number  (document_number) UNIQUE
#  index_enterprises_on_slug             (slug) UNIQUE
#
class Enterprise < ApplicationRecord
  extend FriendlyId
  has_one_attached :logo
  validates_uniqueness_of :document_number
  before_save :generate_uuid
  validates_presence_of %i[company_name fantasy_name document_number email opening_date primary_color secondary_color]
  friendly_id :uuid, use: :finders

  def generate_uuid
    self.uuid = SecureRandom.uuid
  end
end
