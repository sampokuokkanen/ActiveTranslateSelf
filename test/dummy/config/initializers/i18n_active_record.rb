require 'i18n/backend/active_record'
I18n.backend = I18n::Backend::ActiveRecord.new

I18n::Backend::ActiveRecord.include I18n::Backend::Memoize
I18n::Backend::Simple.include I18n::Backend::Memoize
I18n::Backend::Simple.include I18n::Backend::Pluralization
I18n::Backend::ActiveRecord::Missing.prepend ActiveTranslateSelf::Missing
I18n::Backend::Simple.include I18n::Backend::ActiveRecord::Missing

I18n.backend = I18n::Backend::Chain.new(I18n::Backend::Simple.new, I18n.backend)

I18n::Backend::ActiveRecord.configure do |config|
  # config.cache_translations = true # defaults to false
  # config.cleanup_with_destroy = true # defaults to false
end
