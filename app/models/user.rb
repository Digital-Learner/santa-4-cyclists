class User < ActiveRecord::Base
  attr_accessible :email, :name

  validates :name, presence: true,
                   length: { maximum: 25 }
end
