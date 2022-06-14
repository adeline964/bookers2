class UsersController < ApplicationController
  def new

  end
  def index
    @users=User.all
    @book=Book.new
  end
  def show
    @user=User.find(params[:id])
    @books=@user.books
    @book=Book.new
  end
  def edit
    @user=User.find(params[:id])
    if @user.id == current_user.id
      flash[:notice]="You have updated user successfully."
    else
      redirect_to user_path(current_user.id)
    end
  end
  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
      redirect_to user_path(@user.id)
    else
      render :index
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end
end
