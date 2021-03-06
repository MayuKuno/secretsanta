class GroupsController < ApplicationController

  def index
    @groups = Group.all

  end
  def show

    @group = Group.find(params[:id])
    # @message = Message.new
    # @messages = @group.messages.includes(:user)
  end
  def new
    @group = Group.new
    @group.users << current_user

  end

  def create
    # binding.pry
    Group.create(group_params)
    redirect_to posts_path
    
    # @message = @group.messages.new(message_params)

  end

 

def edit
  @group = Group.find(params[:id])

end
def update
  group = Group.find(params[:id])
  group.update(group_params)
  redirect_to groups_path

end
def destroy
  group = Group.find(params[:id])
  group.destroy
  redirect_to posts_path
end
  private
  def group_params
    params.require(:group).permit(:name, :budget, :period, user_ids: [])
  end

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end



