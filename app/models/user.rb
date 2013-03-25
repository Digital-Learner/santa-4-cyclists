class User < ActiveRecord::Base
  attr_accessible :email, :name

  validates :name, presence: true,
                   length: { maximum: 25 }

  validates :email, presence: true
  validates_format_of :email, :with => /@/
end
