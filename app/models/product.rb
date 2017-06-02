class Product < ApplicationRecord
	has_many :tags, :dependent => :destroy
	has_many :scores, :dependent => :destroy

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
