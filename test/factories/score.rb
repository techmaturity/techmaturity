require 'faker'

FactoryBot.define do

  factory :score, class: Score do

    product { FactoryBot.create :product_with_tags }

    a1 { Faker::Number.between(1, 4) }
    a2 { Faker::Number.between(1, 4) }
    a3 { Faker::Number.between(1, 4) }
    a4 { Faker::Number.between(1, 4) }
    a5 { Faker::Number.between(1, 4) }
    a6 { Faker::Number.between(1, 4) }
    a7 { Faker::Number.between(1, 4) }
    a8 { Faker::Number.between(1, 4) }
    a9 { Faker::Number.between(1, 4) }
    a10 { Faker::Number.between(1, 4) }
    a11 { Faker::Number.between(1, 4) }
    a12 { Faker::Number.between(1, 4) }
    b1 { Faker::Number.between(1, 4) }
    b2 { Faker::Number.between(1, 4) }
    b3 { Faker::Number.between(1, 4) }
    b4 { Faker::Number.between(1, 4) }
    b5 { Faker::Number.between(1, 4) }
    b6 { Faker::Number.between(1, 4) }
    b7 { Faker::Number.between(1, 4) }
    b8 { Faker::Number.between(1, 4) }
    c1 { Faker::Number.between(1, 4) }
    c2 { Faker::Number.between(1, 4) }
    c3 { Faker::Number.between(1, 4) }
    c4 { Faker::Number.between(1, 4) }
    c5 { Faker::Number.between(1, 4) }
    c6 { Faker::Number.between(1, 4) }
    c7 { Faker::Number.between(1, 4) }
    c8 { Faker::Number.between(1, 4) }
    c9 { Faker::Number.between(1, 4) }
    c10 { Faker::Number.between(1, 4) }
    d1 { Faker::Number.between(1, 4) }
    d2 { Faker::Number.between(1, 4) }
    d3 { Faker::Number.between(1, 4) }
    d4 { Faker::Number.between(1, 4) }
    d5 { Faker::Number.between(1, 4) }
    d6 { Faker::Number.between(1, 4) }
    d7 { Faker::Number.between(1, 4) }
    d8 { Faker::Number.between(1, 4) }
    e1 { Faker::Number.between(1, 4) }
    e2 { Faker::Number.between(1, 4) }
    e3 { Faker::Number.between(1, 4) }
    e4 { Faker::Number.between(1, 4) }


  end

end