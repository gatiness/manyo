require 'i18n'
I18n.locale # => :en
I18n.locale = :ja
I18n.locale # => :ja
require 'faker'
Faker::Config.locale # => :ja
Faker::Internet.email # => ".@.com"


10.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               admin: false
               )
end

name = "alien"
email = "a@a.com"
password = "111111"
User.create!(name: name,
             email: email,
             password: password,
             password_confirmation: password,
             admin: true
             )

10.times do |n|
    name = Faker::Name.name
    Label.create!(name: name,
                 )
end 