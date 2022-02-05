# frozen_string_literal: true

require 'translate_self/translation'

module ActiveTranslateSelf
  module CoreExt
    include Translation
  end
end
String.include ActiveTranslateSelf::CoreExt
