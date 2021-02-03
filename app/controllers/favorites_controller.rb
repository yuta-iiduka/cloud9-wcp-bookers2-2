class FavoritesController < ApplicationController
    
    def create
        book = Book.find(params[:book_id])
        favorite = current_user.favorites.new(book_id: book.id)
        favorite.save
        #ページの更新
        #本来は/books/favarites/...にリダイレクトされるが，backにより一つ前のページに戻すことで更新したことにする
        redirect_back(fallback_location: root_path) 
    end
    
    def destroy
        book = Book.find(params[:book_id])
        favorite = current_user.favorites.find_by(book_id: book.id)
        favorite.destroy
        @path = request.path
        redirect_back(fallback_location: root_path)
    end
    
    
end
