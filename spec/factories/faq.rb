require 'faker'

FactoryGirl.define do
  factory :faq_question, class: Faq::Question do
    subject     Faker::Lorem.characters(char_count = 20)
    answer      Faker::Lorem.characters(char_count = 300)
    order       1
  end

  factory :faq_category, class: Faq::Category do
    title       Faker::Lorem.characters(char_count = 21)
    image       { File.new(Faq::Engine.root.join('spec', 'fixtures', 'test.jpg')) }
    order       1
  end
end
