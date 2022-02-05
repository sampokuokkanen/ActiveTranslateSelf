# frozen_string_literal: true

require 'active_translate_self/version'
require 'active_translate_self/engine'
require 'active_translate_self/core_ext'
require 'i18n/backend/active_record/active_translate_self/missing'

# A Rails engine that connects TranslateSelf to Rails
module ActiveTranslateSelf
  mattr_accessor :auth_key
  mattr_accessor :host

  ActiveSupport.on_load(:active_record) do
    DeepL.configure do |config|
      config.auth_key = ActiveTranslateSelf.auth_key || ENV['DEEPL_AUTH_KEY']
      config.host = ActiveTranslateSelf.host || 'https://api-free.deepl.com' # Default value is 'https://api.deepl.com'
    end
  end
end
