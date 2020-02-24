# EasyFilter
Makes sorting fun

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'easy_filter', git: 'https://github.com/Amir-Elbashary/easy_filter.git'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install easy_filter
```

After running bundle
```bash
rails g easy_filter:install
```
then run `rails db:migrate`

mount the gem to your routes `mount EasyFilter::Engine => "/easy_filters"`

Navigate to `yourapp/easy_filter/filters` to start using it

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
