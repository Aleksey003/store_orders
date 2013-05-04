class ProductStatesController < ApplicationController
  # GET /product_states
  # GET /product_states.json
  load_and_authorize_resource
  def index
    @product_states = ProductState.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_states }
    end
  end

  # GET /product_states/1
  # GET /product_states/1.json
  def show
    @product_state = ProductState.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_state }
    end
  end

  # GET /product_states/new
  # GET /product_states/new.json
  def new
    @product_state = ProductState.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_state }
    end
  end

  # GET /product_states/1/edit
  def edit
    @product_state = ProductState.find(params[:id])
  end

  # POST /product_states
  # POST /product_states.json
  def create
    @product_state = ProductState.new(params[:product_state])

    respond_to do |format|
      if @product_state.save
        format.html { redirect_to @product_state, notice: 'Product state was successfully created.' }
        format.json { render json: @product_state, status: :created, location: @product_state }
      else
        format.html { render action: "new" }
        format.json { render json: @product_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_states/1
  # PUT /product_states/1.json
  def update
    @product_state = ProductState.find(params[:id])

    respond_to do |format|
      if @product_state.update_attributes(params[:product_state])
        format.html { redirect_to @product_state, notice: 'Product state was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_states/1
  # DELETE /product_states/1.json
  def destroy
    @product_state = ProductState.find(params[:id])
    @product_state.destroy

    respond_to do |format|
      format.html { redirect_to product_states_url }
      format.json { head :no_content }
    end
  end
end
