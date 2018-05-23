class KittensController < ApplicationController

	def index
		@kittens = Kitten.all
		respond_to do |format|
			format.html
			format.json { render json: @kittens.to_json }
		end
	end

	def show
		@kitten = Kitten.find(params[:id])
		respond_to do |format|
			format.html
			format.json { render json: @kitten.to_json }
		end
	end

	def new
		@kitten = Kitten.new
	end

	def create
		@kitten = Kitten.new(kitten_params)
		if @kitten.save
			flash[:success] = "New kitten created"
			redirect_to root_url
		else
			render :new
		end
	end

	def edit
		@kitten = Kitten.find(params[:id])
	end

	def update
		@kitten = Kitten.find(params[:id])
		if @kitten.update_attributes(kitten_params)
			flash[:success] = "Kitten updated"
			redirect_to root_url
		else
			render :edit
		end
	end

	def destroy
		@kitten = Kitten.find(params[:id]).destroy
		flash[:success] = "Kitten deleted!"
		redirect_to root_url
	end

	private

	def kitten_params
		params.require(:kitten).permit(:name, :age, :cuteness, :softness)
	end

end
