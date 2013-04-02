# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  flag       :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  url        :string(255)
#  user_id    :integer
#

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
