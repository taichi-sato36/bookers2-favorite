class BookCommentsController < ApplicationController

	def create
		book = Book.find(params[:book_id])
		comment = current_user.book_comments.new(book_comment_params)
		comment.book_id = book.id
		comment.save
		redirect_to book_path(book.id)
	end

	def destroy
		@book = Book.find(params[:book_id])
		@book_comment = BookComment.find(params[:id])
		@book_comment.destroy
		redirect_to book_path(@book.id)
	end

private
def book_comment_params
	params.require(:book_comment).permit(:comment)
end

end



# def destroy
# 		@book = Book.find(params[:id])
# 	    @books = Book.all
# 	  	if @book.destroy
# 	      flash[:notice] = "Book was successfully destroyed."
# 	  	  redirect_to books_path
# 	    else
# 	      render "index"
# 	    end
# 	end