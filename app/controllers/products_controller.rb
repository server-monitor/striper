class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy, :buy]

  # POST /products/1
  # ??? POST /products/1.json ???
  def buy
    customer = Stripe::Customer.create(
      email:  params[:stripeEmail], source: params[:stripeToken]
    )

    Stripe::Charge.create(
      customer:    customer.id,
      amount:      @product.price.to_i * 100,
      description: "#{@product.id}:#{@product.name}",
      currency:    'usd'
    )

    @product.update(count: @product.count - 1)
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  # GET /products
  # GET /products.json
  def index
    @products = Product.order(:name)
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

    respond_to do |format|
      if @product.save
        format.html do
          redirect_to @product, notice: 'Product was successfully created.'
        end

        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }

        format.json do
          render json: @product.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html do
          redirect_to @product, notice: 'Product was successfully updated.'
        end

        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }

        format.json do
          render json: @product.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html do
        redirect_to products_url, notice: 'Product was successfully destroyed.'
      end

      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the
  # white list through.
  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
