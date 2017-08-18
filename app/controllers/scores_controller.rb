
# Scores controller permits only creation and view (index and show)
class ScoresController < ApplicationController
  before_action :set_product
  before_action :set_score, only: [:show]

  # GET /scores
  # GET /scores.json
  def index
    @scores = @product.scores.all
  end

  # GET /scores/1
  # GET /scores/1.json
  def show; end

  # GET /scores/new
  def new
    build_params = @product.scores.last.nil? ? {} : @product.scores.last.attributes
    @score = @product.scores.new(build_params)
  end

  # POST /scores
  # POST /scores.json
  def create
    @score = @product.scores.new(score_params)
    respond_to do |format|
      if @product.is_assessable? && @score.save
        format.html { redirect_to @product, notice: { type: 'success', message: 'Score was successfully created.' } }
        format.json { render :show, status: :created, location: @score }
      else
        format.html { render :new, notice: { type: 'danger', message: 'Score failed to create.' } }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_score
    @score = @product.scores.find(params[:id])
  end

  def score_params
    params.require(:score).permit(:a1, :a2, :a3, :a4, :a5, :a6, :a7, :a8, :a9, :a10, :a11, :a12,
                                  :b1, :b2, :b3, :b4, :b5, :b6, :b7, :b8, :c1, :c2, :c3, :c4, :c5, :c6, :c7, :c8,
                                  :c9, :c10, :d1, :d2, :d3, :d4, :d5, :d6, :d7, :d8, :e1, :e2, :e3, :e4, :comment)
  end
end
