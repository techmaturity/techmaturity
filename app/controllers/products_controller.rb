class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    if (params[:view] == "accessed")
      @products = Product.includes(:tags, :scores).where(isAssessed: true)
    else
      @products = Product.includes(:tags, :scores)
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.isAssessed = false

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: {:type => 'success', :message => 'Asset was successfully created.'}}
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, notice: {:type => 'danger', :message => 'Asset failed to create.'}}
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: {:type => 'success', :message => 'Asset was successfully created.'}}
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_path, notice: {:type => 'success', :message => 'Asset was successfully destroyed.'} }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :product_type)
    end
end
