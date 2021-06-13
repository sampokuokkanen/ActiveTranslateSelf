require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test 'user name can be translated' do
    assert_match @user.name.to_fi, 'Hei'
  end
end
