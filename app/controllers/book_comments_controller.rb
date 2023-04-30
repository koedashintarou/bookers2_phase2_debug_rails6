class BookCommentsController < ApplicationController
  def create
    # @book = Book.find(params[:book_id])
    # @comment = current_user.book_comments.new(book_comment_params)
    # @comment.book_id = @book.id
    # @comment.save
    # # redirect_to book_path(book.id)
    # @book_comments = Book.find(params[:book_id]).book_comments
    
    book = Book.find(params[:book_id])
  comment = current_user.book_comments.new(book_comment_params)
  comment.book_id = book.id
  comment.save
  @book=Book.find(params[:book_id])
  @book_comment = BookComment.new
  # if @book_comment.save
  #   respond_to do |format|
  #     format.js
  #   end
  #   end
  end

  def destroy
   @book = Book.find(params[:book_id])
    @comment = BookComment.find_by(id: params[:id], book_id: params[:book_id])
    @comment.destroy
    # redirect_to book_path(book.id)
  end

  private
  def book_comment_params
    params.require(:book_comment).permit(:body)
  end
end
