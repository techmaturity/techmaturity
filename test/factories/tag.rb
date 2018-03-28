require 'faker'

class TagKeyHelper
  TAG_KEYS = ['Faker::Address.city',
              'Faker::Address.country',
              'Faker::App.author',
              'Faker::Book.publisher',
              'Faker::Book.genre',
              'Faker::Cat.breed',
              'Faker::Job.field'
              ]

  def self.tag_keys
    TAG_KEYS
  end
end


FactoryBot.define do

  factory :tag, class: Tag do
    # this might be overly fancy :-/
    transient do
      kindex  { Faker::Number.between(0, TagKeyHelper.tag_keys.size-1) }
    end

    key { "#{TagKeyHelper.tag_keys[kindex].partition('.').last}" }
    value { "#{eval(TagKeyHelper.tag_keys[kindex])}" }
    product { FactoryBot.create :product }
  end

end