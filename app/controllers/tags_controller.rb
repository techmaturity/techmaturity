
# This controller is only for new, create, update and destory
class TagsController < ApplicationController
  before_action :set_product
  before_action :set_tag, only: %i[edit update destroy]

  # GET /tags/new
  def new
    @tag = @product.tags.new
  end

  # GET /tags/1/edit
  def edit
    return if CONFIGS[:enable_tag_modification]
    @product = Product.find(params[:product_id])
    redirect_to @product, notice: { type: 'danger', message: 'Editing tag has been disabled.' }
  end

  # POST /tags
  # POST /tags.json
  def create
    @tag = @product.tags.new(tag_params)

    respond_to do |format|
      if @tag.save
        format.html { redirect_to @product, notice: { type: 'success', message: 'Tag was successfully created.' } }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, notice: { type: 'danger', message: 'Tag failed to create.' } }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to @product, notice: { type: 'success', message: 'Tag was successfully updated.' } }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to @product, notice: { type: 'success', message: 'Tag was successfully destroyed.' } }
      format.json { head :no_content }
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_tag
    @tag = @product.tags.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tag_params
    params.require(:tag).permit(:key, :value)
  end
end
