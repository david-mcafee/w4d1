# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string           not null
#

class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true

  has_many :contact_shares,
    dependent: :destroy,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :ContactShare

  has_many :shared_contacts,
    dependent: :destroy,
    through: :contact_shares, source: :contact
end
