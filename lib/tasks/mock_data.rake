namespace :mock_data do
  desc "Populate the database with 100 assets, scores and tags"
  task populate: :environment do

    logger           = Logger.new(STDOUT)
    logger.level     = Logger::INFO
    Rails.logger     = logger

    start_products = Product.all.count

    100.times do

      p = FactoryBot.create(:product_with_tags)
      Faker::Number.between(1, 5).times do
        FactoryBot.create(:score, product: p)
      end
      Rails.logger.info("Created product #{p.name} with score #{p.latest_score.total}")
    end

    Rails.logger.info("Created #{Product.all.count - start_products} products")

  end
end

