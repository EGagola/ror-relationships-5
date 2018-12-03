class BookController < ApplicationController
  def list
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to :action => 'list'
    end

 end

 def book_params
    params.require(:books).permit(:title, :page_count, :author_id)
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

   if @book.update_attributes(book_param)
      redirect_to :action => 'show', :id => @book
   end

end

def book_param
   params.require(:book).permit(:title, :page_count, :author_id)
  end

  def delete
    Book.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
