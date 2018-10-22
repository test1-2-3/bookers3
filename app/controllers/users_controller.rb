class UsersController < ApplicationController
before_action :authenticate_user!

  def index
  	@users = User.all
  	@books = Book.all
  	@book = Book.new
  end
  def show
    @book = Book.new
    # if @book.save
    # redirect_to action: 'show'
    # end
  	@user = User.find(params[:id])
    if @user == current_user
    @user = current_user
    end
  	@books = @user.books
  	    #@books = @user.books.page(params[:page]).reverse_order
  end
  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
    	redirect_to user_path
    end
  end
  def create
    if @user.save
    redirect_to user_path
    else render :edit
    end
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path
    else render :edit
    end
  end

  private 
  def user_params
	    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  def set_user
	      @user = User.find(params[:id])
  end
end
