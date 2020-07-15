class UsersController < ApplicationController
  # before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
  #   :following, :followers]
 def index
  return nil if params[:keyword] == ""
  @users = User.where(['name LIKE ?', "%#{params[:keyword]}%"] ).where.not(id: current_user.id).limit(10)
  respond_to do |format|
    format.html
    format.json
  end
 end

  def show
    @user = User.find(params[:id])
    @posts = Post.all
    @categories = Category.all

  end


  def edit
    @user = User.find(params[:id])

  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end
  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  private

  def user_params
    params.require(:user).permit(:name, :email, :image, :description, group_ids: [],post_ids: [])
  end
  # def logged_in_user
  #   unless logged_in_user
  #     flash[:danger] = "Please log in."
  #     redirect_to login_url
  #   end
  # end
end
