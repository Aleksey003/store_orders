class AssetsController < ApplicationController
	def index
		if params[:product_id].nil?
 			@assets = Asset.all
 		else
 			@assets = Asset.where(product_id: params[:product_id])
 		end
 		respond_to do |format|
 			format.html
 			format.json {render json: @assets.map{|asset| asset.to_jq_upload}}
 		end
 	end

 	def show
 		@asset = Asset.find(params[:id])
 		respond_to do |format|
 			format.html
 			format.json {render json: @asset}
 		end
 	end

 	def new
 		@asset = Asset.new
 		respond_to do |format|
 			format.html
 			format.json {render json: @asset}
 		end
 	end

 	def edit
 		@asset = Asset.find(params[:id])
 	end

 	def create
 		if params[:encoded_image]
 			decoded_file = Base64.decode64(params[:encoded_image])
 			#begin
 				file = Tempfile.new([params[:title_image] , ".#{params[:type]}"])
 				file.binmode
 				file.write decoded_file

 				@asset = Asset.find_by_caption(params[:caption])
 				
 				if @asset.nil?
 					@asset = Asset.new
 				end 

				@asset.product_id = params[:product_id]
				@asset.caption = params[:caption] 
 				
 				@asset.data = file
 				file.close
 			#rescue Exception => e
 				
 			#end
 		else
 			@asset = Asset.new(params[:asset])
 		end
 		respond_to do |format|
 			if @asset.save
 				format.html{
 					render json: [@asset.to_jq_upload].to_json,
 					content_type: 'text/html',
 					layout: false
 				}
 				format.json {render json: {status: :created}}
 			else
 				format.html {render action: 'new'}	
 				format.json {render json: @asset.errors, status: :unprocessable_entity}
 			end
 		end
 	end


 	def update
 		@asset = Asset.find(params[:id])
 		respond_to do |format|
 			if @asset.update_attributes(params[:asset])
 				format.html
 				format.json
 			else
 				format.html { render action: "edit"}
 				format.json {render json: @asset.errors, status: :unprocessable_entity}
 			end
 		end
 	end

 	def destroy
 		@asset = Asset.find(params[:id])
 		@asset.destroy
 		respond_to do |format|
 			format.html {redirect_to assets_url}
 			format.json {head :no_content}
 		end
 	end
 	
end