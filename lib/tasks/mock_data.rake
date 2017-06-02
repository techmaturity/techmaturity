namespace :mock_data do
  desc "Populate the database with 100 assets, scores and tags"
  task populate: :environment do

    product_types = ["Product", "Componenet", "Sub component"]

    100.times do 
      p = Product.create({name: Faker::Name.name, product_type: product_types[Faker::Number.between(0, 2)], is_assessed: true})
      Faker::Number.between(1, 5).times do
        p.scores.create(generate_score_attributes)
      end
      Faker::Number.between(1, 5).times do
        key_index = Faker::Number.between(0, 3)
        p.tags.create(generate_tag_attributes(key_index))
      end
    end

  end
end

private 

def generate_score_attributes
  { a1: Faker::Number.between(1, 4), a2: Faker::Number.between(1, 4),
  a3: Faker::Number.between(1, 4), a4: Faker::Number.between(1, 4),
  a5: Faker::Number.between(1, 4), a6: Faker::Number.between(1, 4),
  a7: Faker::Number.between(1, 4), a8: Faker::Number.between(1, 4),
  a9: Faker::Number.between(1, 4), a10: Faker::Number.between(1, 4),
  a11: Faker::Number.between(1, 4), a12: Faker::Number.between(1, 4),
  b1: Faker::Number.between(1, 4), b2: Faker::Number.between(1, 4),
  b3: Faker::Number.between(1, 4), b4: Faker::Number.between(1, 4),
  b5: Faker::Number.between(1, 4), b6: Faker::Number.between(1, 4),
  b7: Faker::Number.between(1, 4), b8: Faker::Number.between(1, 4),
  c1: Faker::Number.between(1, 4), c2: Faker::Number.between(1, 4),
  c3: Faker::Number.between(1, 4), c4: Faker::Number.between(1, 4),
  c5: Faker::Number.between(1, 4), c6: Faker::Number.between(1, 4),
  c7: Faker::Number.between(1, 4), c8: Faker::Number.between(1, 4),
  c9: Faker::Number.between(1, 4), c10: Faker::Number.between(1, 4),
  d1: Faker::Number.between(1, 4), d2: Faker::Number.between(1, 4),
  d3: Faker::Number.between(1, 4), d4: Faker::Number.between(1, 4),
  d5: Faker::Number.between(1, 4), d6: Faker::Number.between(1, 4),
  d7: Faker::Number.between(1, 4), d8: Faker::Number.between(1, 4),
  e1: Faker::Number.between(1, 4), e2: Faker::Number.between(1, 4),
  e3: Faker::Number.between(1, 4), e4: Faker::Number.between(1, 4) }
end

def generate_tag_attributes(index)
  tags_list = ["character", "house", "city", "dragon"]
  tag_value = case index
    when 0 
      Faker::GameOfThrones.character
    when 1 
      Faker::GameOfThrones.house
    when 2 
      Faker::GameOfThrones.city
    when 3 
      Faker::GameOfThrones.dragon
  end
  {key: tags_list[index], value: tag_value}
end

