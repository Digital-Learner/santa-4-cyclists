
class UserFactory

  def self.user
    User.create!( name: "Example User",
                  email: "user@example.com",
                  password: "foobar",
                  password_confirmation: "foobar"
                )
  end

  # def self.logged_in_user
  #   user = User.create!( name: "Example User",
  #                 email: "user@example.com",
  #                 password: "foobar",
  #                 password_confirmation: "foobar"
  #               )
  #   Session.create!(user.id)
  # end

  def self.user_without_password
  end

  def self.user_with_non_matching_password
  end

  # def self.ten_users
  #   Array.new(10) { user }
  # end

end