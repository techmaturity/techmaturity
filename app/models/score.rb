class Score < ApplicationRecord
	belongs_to :product
	before_save :score_before_save
  
	scope :summary, -> { joins(:product).where(latest: true).select("avg(a1) as a1, avg(a2) as a2, avg(a3) as a3, 
	avg(a4) as a4, avg(a5) as a5, avg(a6) as a6, avg(a7) as a7, avg(a8) as a8, 
	avg(a9) as a9, avg(a10) as a10, avg(a11) as a11, avg(a12) as a12, avg(b1) as b1, 
	avg(b2) as b2, avg(b3) as b3, avg(b4) as b4, avg(b5) as b5, avg(b6) as b6, 
	avg(b7) as b7, avg(b8) as b8, avg(c1) as c1, avg(c2) as c2, avg(c3) as c3, 
	avg(c4) as c4, avg(c5) as c5, avg(c6) as c6, avg(c7) as c7, avg(c8) as c8, 
	avg(c9) as c9, avg(c10) as c10, avg(d1) as d1, avg(d2) as d2, avg(d3) as d3, 
	avg(d4) as d4, avg(d5) as d5, avg(d6) as d6, avg(d7) as d7, avg(d8) as d8, 
	avg(e1) as e1, avg(e2) as e2, avg(e3) as e3, avg(e4) as e4, avg(a) as a, 
	avg(b) as b, avg(c) as c, avg(d) as d, avg(e) as e, avg(total) as total")}
  
	def archive
	  self.update_columns(:latest => false)
	end
  
	def get_capability_array
	  [self.a1.to_i,self.a2.to_i,self.a3.to_i,self.a4.to_i,self.a5.to_i,self.a6.to_i,self.a7.to_i,self.a8.to_i,self.a9.to_i,self.a10.to_i,self.a11.to_i,self.a12.to_i,
		self.b1.to_i,self.b2.to_i,self.b3.to_i,self.b4.to_i,self.b5.to_i,self.b6.to_i,self.b7.to_i,self.b8.to_i,
		self.c1.to_i,self.c2.to_i,self.c3.to_i,self.c4.to_i,self.c5.to_i,self.c6.to_i,self.c7.to_i,self.c8.to_i,self.c9.to_i,self.c10.to_i,
		self.d1.to_i,self.d2.to_i,self.d3.to_i,self.d4.to_i,self.d5.to_i,self.d6.to_i,self.d7.to_i,self.d8.to_i,
		self.e1.to_i,self.e2.to_i,self.e3.to_i,self.e4.to_i]
	end
  
	def get_category_array
	  [self.a.to_i, self.b.to_i, self.c.to_i, self.d.to_i, self.e.to_i]
	end
  
	def get_expanded_category_array
	  [[self.a.to_i]*12, [self.b.to_i]*8, [self.c.to_i]*10, [self.d.to_i]*8, [self.e.to_i]*4].flatten
	end
  
	def score_description_array(increment)
	  [get_description_string("a1", self.a1.to_i,increment), get_description_string("a2", self.a2.to_i,increment), get_description_string("a3", self.a3.to_i,increment), 
	  get_description_string("a4", self.a4.to_i,increment), get_description_string("a5", self.a5.to_i,increment), get_description_string("a6", self.a6.to_i,increment), 
	  get_description_string("a7", self.a7.to_i,increment), get_description_string("a8", self.a8.to_i,increment), get_description_string("a9", self.a9.to_i,increment), 
	  get_description_string("a10", self.a10.to_i,increment), get_description_string("a11", self.a11.to_i,increment), get_description_string("a12", self.a12.to_i,increment), 
	  get_description_string("b1", self.b1.to_i,increment), get_description_string("b2", self.b2.to_i,increment), get_description_string("b3", self.b3.to_i,increment), 
	  get_description_string("b4", self.b4.to_i,increment), get_description_string("b5", self.b5.to_i,increment), get_description_string("b6", self.b6.to_i,increment), 
	  get_description_string("b7", self.b7.to_i,increment), get_description_string("b8", self.b8.to_i,increment), get_description_string("c1", self.c1.to_i,increment), 
	  get_description_string("c2", self.c2.to_i,increment), get_description_string("c3", self.c3.to_i,increment), get_description_string("c4", self.c4.to_i,increment), 
	  get_description_string("c5", self.c5.to_i,increment), get_description_string("c6", self.c6.to_i,increment), get_description_string("c7", self.c7.to_i,increment), 
	  get_description_string("c8", self.c8.to_i,increment), get_description_string("c9", self.c9.to_i,increment), get_description_string("c10", self.c10.to_i,increment), 
	  get_description_string("d1", self.d1.to_i,increment), get_description_string("d2", self.d2.to_i,increment), get_description_string("d3", self.d3.to_i,increment), 
	  get_description_string("d4", self.d4.to_i,increment), get_description_string("d5", self.d5.to_i,increment), get_description_string("d6", self.d6.to_i,increment), 
	  get_description_string("d7", self.d7.to_i,increment), get_description_string("d8", self.d8.to_i,increment), get_description_string("e1", self.e1.to_i,increment), 
	  get_description_string("e2", self.e2.to_i,increment), get_description_string("e3", self.e3.to_i,increment), get_description_string("e4", self.e4.to_i,increment)]
	end
  
	private
  
	def score_before_save
	  compute_totals
	  prepare_product
	end
	
	def compute_totals
	  self.a = compute_segment(['a1','a2','a3','a4','a5','a6','a7','a8','a9','a10','a11','a12'])
	  self.b = compute_segment(['b1','b2','b3','b4','b5','b6','b7','b8'])
	  self.c = compute_segment(['c1','c2','c3','c4','c5','c6','c7','c8','c9','c10'])
	  self.d = compute_segment(['d1','d2','d3','d4','d5','d6','d7','d8'])
	  self.e = compute_segment(['e1','e2','e3','e4','e5'])
	  self.total = compute_score
	  self.latest = true
	  self.total
	end
  
	def compute_score
	  score = 0
	  keys = {}
	  CAPABILITIES.each{|key, val| keys[key]=val unless (val.nil? || !key.end_with?("min")) }
	  keys.each{|key,val| score+=1 unless (self[key[0..-5]].nil? || self[key[0..-5]]<val) }
	  score==0 ? 0.0 : (score.to_f / keys.count) * 100
	end
  
	def compute_segment(keys)
	  sum = 0
	  count = 0
	  keys.each do |k| 
		unless self.attributes[k].nil? 
		  sum += self.attributes[k].to_i
		  count += 1
		end
	  end
	  count == 0? 0 : sum / count 
	end
  
	def get_description_string(key, score, increment)
	  if score+increment == 0
		return ""
	  elsif score+increment == 5
		return "Woohoo !! You are already awesome here"
	  else
		return FORMATED_CAPABILITIES("#{key}_#{score+increment}")
	  end
	end
  
	def prepare_product
	  self_product = self.product
	  if self_product.is_assessed?
		self_product.scores.where(latest: true).first.archive
	  else
		self_product.assess
	  end
	end
  
  end
  
