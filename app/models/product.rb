class Product < ApplicationRecord
	has_many :tags, :dependent => :destroy
	has_many :scores, :dependent => :destroy
  
	validates :name, presence: true
	validates :product_type, presence: true
  
	self.per_page = 10
  
	def assess
	  self.update_columns(:is_assessed => true)
	end
  
	def latest_score
	  self.scores.last
	end
  
	default_scope { where(is_active: true) }
  
	scope :search_products, -> (query='', assessed='', page_index) {
	  queries = query.split(' ').map { |w| "%#{w.strip}%" }
	  where_stmt = ['lower(tags.value) LIKE ?'] * queries.size
  
	  if assessed == '1'
		includes(:tags, :scores).joins(:tags).group("products.id")
		  .where( where_stmt.join(' OR ') +' AND products.is_assessed = ? ', *queries, true)
		  .paginate(page: page_index)
	  else
		includes(:tags, :scores).joins(:tags).group("products.id")
		  .where( where_stmt.join(' OR '), *queries)
		  .paginate(page: page_index)
	  end
	}
  
	scope :list_products, -> (assessed='', page_index) {
	  if assessed == '1'
		includes(:tags, :scores)
		  .where(is_assessed: true)
		  .paginate(page: page_index)
	  else
		includes(:tags, :scores)
		  .paginate(page: page_index)
	  end
	}
	  
  end
