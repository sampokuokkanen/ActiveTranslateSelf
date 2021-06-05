require 'test_helper'

class CoreExtTest < ActiveSupport::TestCase
  test 'strings_can_translate_themselves' do
    assert_equal 'Hei', 'Hello'.translate_to_fi
  end
end
