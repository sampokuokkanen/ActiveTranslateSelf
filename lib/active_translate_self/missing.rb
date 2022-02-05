module ActiveTranslateSelf
  module Missing
    def store_default_translation(locale, key, interpolations)
      translation = I18n::Backend::ActiveRecord::Translation.new locale: locale.to_s, key: key
      default = I18n.t(key, locale: I18n.default_locale)
      translation.value = default.public_send "to_#{locale}" if default.respond_to?("to_#{locale}")
      translation.interpolations = interpolations
      translation.save
    end
  end
end