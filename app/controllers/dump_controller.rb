
# The Dump Controller is used to expose an endpoint for grabbing 
# the complete list of products and the score.
class DumpController < ApplicationController

    def dump
        @products = Product.all.includes(:tags, :scores)
    end

end
