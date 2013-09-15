class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  load_and_authorize_resource
  def index

		if !params[:category_id].nil?
	   @products = Product.where(product_category_id: params[:category_id]).paginate(page: params[:page]).includes(:product_state)
		elsif params[:query].present?
      @products =  Product.search(params)
    else 
      @products = Product.paginate(page: params[:page]).includes(:product_state,:product_category)  	
		end

    if params[:product_list] == "1"
      session[:product_list] = "1"
    elsif params[:product_list] == "2"
      session[:product_list] = nil
    end
    
    #@cart = current_cart
   
    respond_to do |format|
      format.html { 
        if  session[:product_list] == "1"
          render 'index' 
        else
          render 'index2'
        end} 
      format.json { render json: @products }
      format.js
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.includes(:assets).find(params[:id])
    @product_assets = @product.assets
    if params[:show_quantity]    
      @product_quantity = @product.get_quantity
    else
      @product_quantity = nil
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
      format.js
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new		
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
	end

  # POST /products
  # POST /products.json
  def create
    if params[:id]
      @product = Product.find_by_id(params[:id])
      if @product.nil?
        @product = Product.new(params[:product])
        @product.id = params[:id] if params[:id]
      else
        @product.assign_attributes(params[:product])
      end
    else
      @product = Product.new(params[:product])
      @product.id = params[:id] if params[:id]
    end
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  def who_bought
    @product = Product.find(params[:id])
    respond_to do |format|
      format.atom
    end  
  end

  def show_quantity
      if params[:products]
        @product_quantity = Product.get_quantitys(params[:products])
          respond_to do |format|
          format.js 
        end
      end
  end

end
