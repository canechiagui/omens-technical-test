class Api::ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]

  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products
  def index
    @products = Product.all
    render json: @products
  end


  # GET /products/1
  def show
    render json: @product
  end


  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end


  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product, status: :ok
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end


  # DELETE /products/1
  def destroy
    @product.destroy
    render json: { message: "Product was successfully destroyed" }, status: :ok
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :price, :stock_quantity, :description)
    end
end
