# == Schema Information
#
# Table name: contacts
#
#  id      :integer          not null, primary key
#  name    :string           not null
#  email   :string           not null
#  user_id :integer          not null
#

# validates :user_name, :presence => true, :uniqueness => {:scope => :account_id}

class Contact < ActiveRecord::Base
  validates :email, presence: true, uniqueness: {scope: :user_id}
  validates :user_id, presence: true

  has_many :contact_shares,
    primary_key: :id,
    foreign_key: :contact_id,
    class_name: :ContactShare

  has_many :shared_users, through: :contact_shares, source: :user
end
