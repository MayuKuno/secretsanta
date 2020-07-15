class PostsController < ApplicationController
  def index
    @posts = Post.all
    # return nil if params[:keyword] == ""
    # @categories = Category.where(['name LIKE ?', "%#{params[:keyword]}%"] ).limit(10)
    # @users = User.where(['name LIKE ?', "%#{params[:keyword]}%"] ).where.not(id: current_user.id).limit(10)
    # respond_to do |format|
    #   format.html
    #   format.json
    # end
  end
  def show
    @category = Category.find(params[:id])
    @giver = Giver.find(params[:id])

  end
  def new
    @post = Post.new
    # @users = User.all
    @categories = Category.all
    # @group = Group.new
    @post.categories 
  end

  def create
    # binding.pry
    @post = Post.new(post_params)
    @categories = Category.all

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])

  end
  def update
    post = Post.find(params[:id])
    post.update(post_params)
  end
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path

  end
  def search
    @categories = Post.all.search(params[:keyword])
    @posts = Post.all
  end
  private
  def post_params
    params.require(:post).permit(:text, :image, category_ids: [], giver_ids: []).merge(user_id: current_user.id)
  end
end
