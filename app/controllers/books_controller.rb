class BooksController < ApplicationController
  def new
  end

  def edit
     @book = Book.find(params[:id])
  end

  def create

    #book = Book.new(book_params)
    #book.save
    #redirect_to '/books'#

    @book = Book.new(book_params)
    if @book.save
      redirect_to "/books"
    else
     @books = Book.all
     render:index
    end

  end

    def destroy
       book = Book.find(params[:id])
      if book.destroy
       redirect_to '/books'
       flash[:alret] = "Book was succesfully destroyed"
      end
    end

  def show
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all
    @book = Book.new
  end

   private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end