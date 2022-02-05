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
    assert_select 'h1', 'Hei'
  end

  test 'it will show the default i18n language' do
    get '/'
    assert_select 'h2', 'Welcome'
  end

  test 'it will translate missing i18n key' do
    get '/', params: { locale: 'fi' }
    assert_select 'h2', 'Tervetuloa'
  end

  test 'it will not translate Korean(not supported by DeepL)' do
    get '/', params: { locale: 'ko' }
    assert_response :success
  end
end
