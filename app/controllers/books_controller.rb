class BooksController < ApplicationController
  def new
  end

  def edit
     @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    if @book.save
    redirect_to "/books/#{@book.id}"
    flash[:notice] = "Book was successfully created"
    else
     @books = Book.all
     render:index
    end

  end

    def destroy
       book = Book.find(params[:id])
      if book.destroy
        redirect_to "/books"
       flash[:notice] = "Book was successfully destroyed"
      end
    end

  def show
    @book = Book.find(params[:id])
  end

  def update
    book= Book.find(params[:id])
    book.update(book_params)
    redirect_to "/books/#{book.id}"
    flash[:notice] = "Book was successfully updated"
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