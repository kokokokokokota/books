class BooksController < ApplicationController
  def new
  end

  def edit
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to '/books'
  end

  def show
  end

  def index
    @book = Book.new
    @books = Book.all  
  end

   private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
