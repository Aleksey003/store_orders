class CartsController < ApplicationController
  # GET /carts
  # GET /carts.json
  load_and_authorize_resource
  def index
    #@carts = Cart.accessible_by(current_ability).paginate(page: params[:page])
    #@carts = Cart.accessible_by(current_ability)
    @carts_grid = initialize_grid(Cart,
      :name => 'carts_grid',
      :order => 'carts.id', :order_direction => 'desc', :include => [:user],
      :enable_export_to_csv => true,
      :csv_field_separator => ';',
      :csv_file_name => 'projects' )

    export_grid_if_requested('carts_grid' => 'carts_grid') do 
    end
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    begin
      @cart = Cart.find(params[:id]) 
    rescue ActiveRecord::RecordNotFound
      logger.error "Cart not found"
      redirect_to products_path, notice: "Cart not found"      
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @cart }
      end
    end
  end

  # GET /carts/new
  # GET /carts/new.json
  def new
    @cart = Cart.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cart }
    end
  end

  # GET /carts/1/edit
  def edit
    @cart = Cart.find(params[:id])
  end

  # POST /carts
  # POST /carts.json
  def create
    @user = current_user
    @cart = @user.carts.build(params[:cart])

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render json: @cart, status: :created, location: @cart }
      else
        format.html { render action: "new" }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /carts/1
  # PUT /carts/1.json
  def update
    @cart = Cart.find(params[:id])

    respond_to do |format|
      if @cart.update_attributes(params[:cart])
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end
end
