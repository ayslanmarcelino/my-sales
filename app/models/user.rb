# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  document_number        :string           not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string           not null
#  is_active              :boolean          default(FALSE)
#  is_admin               :boolean          default(FALSE)
#  is_super_admin         :boolean          default(FALSE)
#  last_name              :string           not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  nickname               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  uuid                   :uuid             not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  enterprise_id          :bigint           not null
#
# Indexes
#
#  index_users_on_document_number       (document_number) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_enterprise_id         (enterprise_id)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (enterprise_id => enterprises.id)
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :enterprise
  validates_uniqueness_of :document_number
  validates_presence_of %i[first_name last_name email document_number enterprise_id]
  extend FriendlyId
  before_save :generate_uuid
  friendly_id :uuid, use: :finders

  def generate_uuid
    self.uuid = SecureRandom.uuid if self.uuid.nil?
  end
end
