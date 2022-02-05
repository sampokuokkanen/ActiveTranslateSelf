# frozen_string_literal: true

require 'zeitwerk'
loader = Zeitwerk::Loader.for_gem
loader.setup # ready!

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

loader.eager_load # optionally
