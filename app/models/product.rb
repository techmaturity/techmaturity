class Product < ApplicationRecord
	has_many :tags
	has_many :scores

	validates :name, presence: true
	validates :product_type, presence: true

	def assess
		self.update_attribute(:isAssessed, true)
	end

	def latest_score
		self.scores.last
	end

end
