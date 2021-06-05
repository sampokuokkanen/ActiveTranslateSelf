# frozen_string_literal: true

require 'test_helper'

class ActiveTranslateSelfTest < ActionDispatch::IntegrationTest

  test 'railtie is loaded' do
    assert_equal ::Rails::Engine, ActiveTranslateSelf::Engine.superclass
  end

  test 'initializer is set' do
    assert_equal ActiveTranslateSelf.host, 'https://api-free.deepl.com'
  end

  test 'the gem will not make the app crash' do
    get '/'
    assert_response :success
    assert_select "h1", 'Hei'
  end
end
