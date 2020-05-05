class BooksController < ApplicationController
		before_action :authenticate_user!
	def index
		@books = Book.all
		@newbook = Book.new
	end



	def create
		@newbook = Book.new(book_params)
		@newbook.user_id = current_user.id
		if @newbook.save
  		flash[:notice] = "Book was successfully created."
  		redirect_to book_path(@newbook.id)
	    else
	    	@books = Book.all
	    	render "index"
	    end
	end


	def show
		@newbook = Book.new
		@book = Book.find(params[:id])
		@book_comment = BookComment.new
		@book_comments = BookComment.all
	end


	def edit
		@book = Book.find(params[:id])
		if @book.user_id != current_user.id
			redirect_to books_path
		end
	end

	def update
		@book = Book.find(params[:id])
		@book.user_id = current_user.id
		if @book.update(book_params)
  		flash[:notice] = "Book was successfully updated."
  		redirect_to book_path(@book.id)
  	else
  		render "edit"
  	end
	end

	def destroy
		@book = Book.find(params[:id])
	    @books = Book.all
	  	if @book.destroy
	      flash[:notice] = "Book was successfully destroyed."
	  	  redirect_to books_path
	    else
	      render "index"
	    end
	end

private

	def book_params
		params.require(:book).permit(:title, :body)
	end


end
