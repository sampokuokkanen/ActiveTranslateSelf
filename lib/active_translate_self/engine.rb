# frozen_string_literal: true

require 'deepl'
module ActiveTranslateSelf
  class Engine < ::Rails::Engine
    isolate_namespace ActiveTranslateSelf
  end
end
