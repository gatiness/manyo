require 'i18n'
I18n.locale # => :en
I18n.locale = :ja
I18n.locale # => :ja
require 'faker'
Faker::Config.locale # => :ja
Faker::Internet.email # => ".@.com"


10.times do |i|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
               email: email,
               password_digest: password,
               )
end
