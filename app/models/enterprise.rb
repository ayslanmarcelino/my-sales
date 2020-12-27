# == Schema Information
#
# Table name: enterprises
#
#  id              :bigint           not null, primary key
#  company_name    :string
#  description     :string
#  document_number :string
#  email           :string
#  fantasy_name    :string
#  opening_date    :date
#  primary_color   :string
#  secondary_color :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_enterprises_on_document_number  (document_number) UNIQUE
#
class Enterprise < ApplicationRecord
  has_one_attached :logo
end
