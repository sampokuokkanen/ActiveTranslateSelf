# ActiveTranslateSelf

[![Gem Version](http://img.shields.io/gem/v/active_translate_self.svg)](https://rubygems.org/gems/active_translate_self)
[![Gem Downloads](https://img.shields.io/gem/dt/active_translate_self.svg)](https://rubygems.org/gems/active_translate_self)

String! Translate yourself! A very хорошо gem!

Finnish, English, Japanese, Russian! 

Translate Ruby strings in Rails to a language of your choice!
Any and all languages supported, as long as they're also supported by DeepL. If your language is not supported at the moment, you just need to wait a bit. Or make a PR for TranslateSelf to add Google Translate backend to it. 

## Usage
Easy to use! 
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
