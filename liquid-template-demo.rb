require 'bundler/inline'
gemfile do
  source 'https://rubygems.org'
  gem 'liquid'
end
Liquid::Template.error_mode = :strict

# my_template = Liquid::Template.parse("{{user_name}} {{price | upcase | money}}\n")
# print my_template.render('user_name' => 'bob', 'price' => '7.99 aaabbb')

# template = "{{user_name}} {{price | upcase | money}}"

module CustomFilters
  def reverse(input)
    input.reverse
  end

  def my_custom_filter(value)
    value + 100
  end
end

Liquid::Template.register_filter(CustomFilters)

template = File.read("template.liquid")

my_template = Liquid::Template.parse(template)
print my_template.render({'user_name' => 'bob', 'price' => 7.99}, { error_mode: :strict, strict_variables: true, strict_filters: true })

print my_template.errors
print "\n"