
# Controller for Products or Assets.
class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  # GET /products
  # GET /products.json
  def index
    @assessed = params[:assessed]
    @products = if params[:assessed] == '1'
                  if params[:q] && params[:q] != ''
                    Product.includes(:tags, :scores).joins(:tags)
                           .where('tags.value LIKE ? AND products.is_assessed = ? ', "%#{params[:q]}%", true)
                           .paginate(page: params[:page])
                  else
                    Product.includes(:tags, :scores)
                           .where(is_assessed: true)
                           .paginate(page: params[:page])
                  end
                else
                  if params[:q] && params[:q] != ''
                    Product.includes(:tags, :scores)
                           .joins(:tags)
                           .where('tags.value LIKE ?', "%#{params[:q]}%")
                           .paginate(page: params[:page])
                  else
                    Product.includes(:tags, :scores)
                           .paginate(page: params[:page])
                  end
                end
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show; end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit; end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.is_assessed = false
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: { type: 'success', message: 'Asset created successfully.' } }
        format.json { render :show, status: :created, location: @product }
      else
        Rails.logger.info("Failed POST to create product, errors: #{@product.errors.full_messages} with parameters #{product_params}")
        format.html { render :new, notice: { type: 'danger', message: 'Asset creation failed.' } }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: { type: 'success', message: 'Asset created successfully.' } }
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
      format.html { redirect_to products_path, notice: { type: 'success', message: 'Asset destroyed successfully.' } }
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
