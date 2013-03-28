# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation

  has_secure_password

  before_save { |user| user.email = email.downcase }

  validates :name, presence: true,
                   length: { maximum: 25 }

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false }
  validates_format_of :email, :with => /@/

  validates :password, presence: true,
                       length: { minimum: 6 },
                       confirmation: true,
                       on: :create

  validates_presence_of :password_confirmation,
                        on: :create
end
