class Product < ApplicationRecord
	has_many :tags
	has_many :scores

	validates :name, presence: true
	validates :product_type, presence: true

	self.per_page = 10

	def assess
		self.update_attribute(:is_assessed, true)
	end

	def latest_score
		self.scores.last
	end

end
