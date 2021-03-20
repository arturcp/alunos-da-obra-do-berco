# frozen_string_literal: true

require 'faker'

Photo.destroy_all
Student.destroy_all

25.times do |i|
  Student.create!(
    name: Faker::Name.name,
    description: Faker::Lorem.sentence(word_count: 8),
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.phone_number,
    mobile_phone: Faker::PhoneNumber.cell_phone,
    address: Faker::Address.full_address,
    gender: Faker::Gender.binary_type.downcase.to_sym,
    birth_date: Faker::Date.between(from: '1995-01-01', to: '2002-01-01'),
    website: Faker::Internet.url,
    twitter: Faker::Internet.url,
    instagram: Faker::Internet.url,
    facebook: Faker::Internet.url,
    observation: Faker::Lorem.sentence(word_count: 25),
    youtube_video: 'https://www.youtube.com/watch?v=-83gGOmQgKI'
  )
end

