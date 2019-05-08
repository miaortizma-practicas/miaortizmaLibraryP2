class BooksController < ApplicationController

	def index
		author = Author.find(params[:author_id])
		render json: author.books, status: 200
	end

	def show
		author = Author.find(params[:author_id])
		book = author.books.find(params[:id])
		render json: book, status: 200
	end

	def create
		author = Author.find(params[:author_id])
		if not author
			render json: author.errors, status: :not_found
		else
			book = author.books.create(book_params)
			if book
				render json: book, status: 201
			else
				render json: book.errors, status: :unprocessable_entity
			end
		end
	end

	def update
		author = Author.find(params[:author_id])
		book = author.books.find(params[:id])
		if book.update(author_params)
			render json: book, status: 201
		else
			render json: book.errors, status: :unprocessable_entity
		end
	end

	def destroy
		author = Author.find(params[:author_id])
		book = author.books.find(params[:id])
		book.destroy
	end

	private 
	def book_params
		params.require(:book).permit(:title, :genre, :color)
	end
end
