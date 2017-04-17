class BooksController < ApplicationController
	before_action :admin_authentication_required!

	def index
		page = params[:page]
		page ||= 1
		@books = Book.order(:updated_at).page(page)
	end

	def new
	end

	def create
		book = Book.new(create_book_params)

		create_book_service.create(book) do |errors| 
			return redirect_to "index" unless errors
			flash[:errors] = errors
			render "new"
		end
	end

	private
	def create_book_params
		params.require(:book).permit(:title, :author, :summary)
	end

	def create_book_service
		@create_book_service ||= CreateBookService.new
	end
end