class AuthorsController < ApplicationController

	def index
		authors = Author.all
		render json: authors, status: 200
	end

	def show
		author = Author.find(params[:id])
		render json: author, status: 200
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
		author = Author.find(params[:id])

		if author.update(author_params)
			render json: author, status: 201
		else
			render json: author.errors, status: :unprocessable_entity
		end
	end

	def destroy
		author = Author.find(params[:id])
		author.destroy
		redirect_to authors_path
	end

	private
		def author_params
			params.require(:author).permit(:name, :age)
		end
end
