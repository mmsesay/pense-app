class GroupController < ApplicationController
  before_action :authenticate_user!, :clear_sessions

  def index
    @groups = current_user.groups.includes(:entities)
  end

  def show
    @group = Group.includes(:entities).find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @new_group = current_user.groups.new(group_params)

    if @new_group.save
      flash[:notice] = "New category created successfully"
      redirect_to group_path
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])

    if @group.update(group_params)
      flash[:notice] = "Category updated successfully"
      redirect_to single_group_path(@group)
    else
      render :edit
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end

  def clear_sessions
    session[:is_transaction_triggered_from_detail] = nil
    session[:group_id] = nil
  end
end
