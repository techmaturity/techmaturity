require 'faker'

product_types = ["Product", "Component", "Sub component"]

FactoryBot.define do

  factory :product, class: Product do
    name { Faker::Commerce.product_name }
    product_type { product_types[Faker::Number.between(0, 2)] }
    is_assessed false

    factory :product_with_tags, class: Product do

      transient do
        tag_count { Faker::Number.between(1, 10) }
      end

      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the post
      after(:create) do |product, evaluator|
        create_list(:tag, evaluator.tag_count, product: product)
      end

    end

  end

end