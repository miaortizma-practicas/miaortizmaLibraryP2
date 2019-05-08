class AuthorsController < ApplicationController

	def index
		authors = Author.all
		respond_to do |format|
			format.xml {render :xml => authors.to_xml, status: 200}
			format.json {render :json => authors, status: 200}	
		end
		render plain: 'hola'
	end

	def show
		author = Author.find(params[:id])
		render json: author, status: 200
	end

	def new
		author = Author.new
	end

	def create
		author = Author.create(author_params)
		if author.save
			render json: author, status: 201
		else
			render json: author.errors, status: :unprocessable_entity
		end
	end



	def update

	end

	def destroy
	end

	private
		def author_params
			params.require(:author).permit(:name, :age)
		end
end
