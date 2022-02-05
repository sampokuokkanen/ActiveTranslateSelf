# ActiveTranslateSelf

[![Gem Version](http://img.shields.io/gem/v/active_translate_self.svg)](https://rubygems.org/gems/active_translate_self)
[![Gem Downloads](https://img.shields.io/gem/dt/active_translate_self.svg)](https://rubygems.org/gems/active_translate_self)

String! Translate yourself! A very хорошо gem!

Finnish, English, Japanese, Russian! 

Translate Ruby strings in Rails to a language of your choice!
Any and all languages supported, as long as they're also supported by DeepL. If your language is not supported at the moment, you just need to wait a bit. Or make a PR for TranslateSelf to add Google Translate backend to it. 

## Supported languages:

supported languages are: Bulgarian, Chinese, Czech, Danish, Dutch, English, Estonian, Finnish, French, German, Greek, Hungarian, Italian, Japanese, Latvian, Lithuanian, Polish, Portuguese, Romanian, Russian, Slovak, Slovenian, Spanish, and Swedish.

## Automatic translations with I18n ActiveRecord backend

So first, install the ActiveRecord backend for I18n from the link below: 
[svenfuchs/i18n-active_record: I18n ActiveRecord backend](https://github.com/svenfuchs/i18n-active_record)

Then, include the following in your `config/initializers/i18n_active_record.rb`:

```ruby
if I18n::Backend::ActiveRecord::Translation.table_exists?
  I18n.backend = I18n::Backend::ActiveRecord.new
  I18n::Backend::ActiveRecord.include I18n::Backend::Memoize
  I18n::Backend::Simple.include I18n::Backend::Memoize
  I18n::Backend::Simple.include I18n::Backend::Pluralization
  # This is the monkeypatch!
  I18n::Backend::ActiveRecord::Missing.prepend ActiveTranslateSelf::Missing
  I18n::Backend::Simple.include I18n::Backend::ActiveRecord::Missing

  I18n.backend = I18n::Backend::Chain.new(I18n::Backend::Simple.new, I18n.backend)
end
```

Now just add a new translation language to your app, and it will be automatically translated using the default language's translation. 

## Usage
Easy to use! 

Now your models get superpowers if they have string fields:

```ruby
user = User.find(2020)
user.favorite_food # or any field name that is a string in Ruby
# hamburgers
user.favorite_food.to_ru # or to_fi, to_es, to_ja...
# гамбургер
```

Just get a DeepL auth key (free!), and create an initializer(`config/initializers/active_translate_self.rb`), add the auth key to your Rails credentials file with the following command:
```shell
$ EDITOR="vim" rails credentials:edit
```

Inside, the file should look like below:

```yml
deepl:
  auth_key: 'my-auth-key'
```

And the initializer should just read that value like below:

```ruby
ActiveTranslateSelf.auth_key = Rails.application.credentials.dig(:deepl, :auth_key)
```

The TranslateSelf gem uses the free DeepL servers by default, but you can also set 
`ActiveTranslateSelf.host` if you want to use the pro license servers. 

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'active_translate_self'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install active_translate_self
```

Build on top of TranslateSelf and DeepL for Ruby. 

[TranslateSelf](https://github.com/sampokuokkanen/translate_self).

[DeepL for ruby](https://github.com/wikiti/deepl-rb).


## Contributing
Contributions are welcome!
Взносы приветствуются! Las contribuciones son bienvenidas! 投稿(コントリビューション)を歓迎します！

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
