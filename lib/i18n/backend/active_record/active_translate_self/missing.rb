# frozen_string_literal: true

# A module that lets the missing module of I18n::Backend::ActiveRecord
# know about the missing translation.
#
# TranslateSelf is used to automatically
# translate missing translations if they can be translated using TranslateSelf.

module I18n
  module Backend
    class ActiveRecord
      module ActiveTranslateSelf
        module Missing
          include ::I18n::Backend::Flatten

          # rubocop: disable Metrics/MethodLength, Metrics/AbcSize
          def store_default_translations(locale, key, options = {})
            count, scope, _, separator = options.values_at(:count, :scope, :default, :separator)
            separator ||= I18n.default_separator
            key = normalize_flat_keys(locale, key, scope, separator)

            return if ActiveRecord::Translation.locale(locale).lookup(key).exists?

            interpolations = options.keys - I18n::RESERVED_KEYS
            keys = if count
                     I18n.t('i18n.plural.keys', locale: locale).map do |k|
                       [key, k].join(FLATTEN_SEPARATOR)
                     end
                   else
                     [key]
                   end
            keys.each { |k| store_default_translation(locale, k, interpolations) }
          end
          # rubocop: enable Metrics/MethodLength, Metrics/AbcSize

          def store_default_translation(locale, key, interpolations)
            translation = ActiveRecord::Translation.new locale: locale.to_s, key: key
            default = I18n.t(key, locale: I18n.default_locale)
            translation.value = default.public_send "to_#{locale}"
            translation.interpolations = interpolations
            translation.save
          end

          def translate(locale, key, options = {})
            result = catch(:exception) { super }

            if result.is_a?(I18n::MissingTranslation)
              store_default_translations(locale, key, options)
              throw(:exception, result)
            else
              result
            end
          end
        end
      end
    end
  end
end
