class EntityController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def new
    @entity = Entite.new
    @groups = Group.all
  end

  def show
    @groups = Group.all
  end

  def create
    @new_transaction = current_user.entities.new(new_transcation_params)

    if @new_transaction.save
      flash[:notice] = "New transcation added successfully"
      redirect_to single_group_path(new_transcation_params[:group_id])
    else
      render :new
    end
  end

  private

  def new_transcation_params
    params.require(:entite).permit(:name, :amount, :group_id)
  end
end
