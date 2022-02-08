class GroupController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = current_user.groups
  end

  def show; end

  def new
    @group = Group.new
  end

  def create
    @new_group = current_user.groups.new(new_group_params)

    if @new_group.save
      flash[:notice] = "New category created successfully"
      redirect_to group_path
    else
      render :new
    end
  end

  private

  def new_group_params
    params.require(:group).permit(:name, :icon)
  end
end
