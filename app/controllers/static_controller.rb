class StaticController < ApplicationController
	def dashboard
		@summary = Score.summary[0]
		@products_count = Product.count
	end

	def docs
	end

	def about
	end

	def contact
	end

	def send_to_slack
		NotifySlackService.build.call({ name: params[:name], email: params[:email], message: params[:message] })
		flash[:notice] = {:type => 'success', :message => 'Thanks for your valuable feedback.'}
		redirect_to :controller => 'products', :action => 'index'
	end

	private

		def get_summary_query_string
			"avg(a1) as a1, avg(a2) as a2, avg(a3) as a3, 
			avg(a4) as a4, avg(a5) as a5, avg(a6) as a6, avg(a7) as a7, avg(a8) as a8, 
			avg(a9) as a9, avg(a10) as a10, avg(a11) as a11, avg(a12) as a12, avg(b1) as b1, 
			avg(b2) as b2, avg(b3) as b3, avg(b4) as b4, avg(b5) as b5, avg(b6) as b6, 
			avg(b7) as b7, avg(b8) as b8, avg(c1) as c1, avg(c2) as c2, avg(c3) as c3, 
			avg(c4) as c4, avg(c5) as c5, avg(c6) as c6, avg(c7) as c7, avg(c8) as c8, 
			avg(c9) as c9, avg(c10) as c10, avg(d1) as d1, avg(d2) as d2, avg(d3) as d3, 
			avg(d4) as d4, avg(d5) as d5, avg(d6) as d6, avg(d7) as d7, avg(d8) as d8, 
			avg(e1) as e1, avg(e2) as e2, avg(e3) as e3, avg(e4) as e4, avg(a) as a, 
			avg(b) as b, avg(c) as c, avg(d) as d, avg(e) as e, avg(total) as total"
		end
		
end
