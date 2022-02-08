class EntityController < ApplicationController
  before_action :authenticate_user!

  def index
    @transactions = Entite.includes(:group).order('created_at DESC').all
  end

  def new
    @entity = Entite.new
    @groups = Group.all
  end

  def show
    @groups = Group.all
  end

  def create
    @new_transaction = nil

    if session[:is_transaction_triggered_from_detail]
      @new_transaction = current_user.entities.new(transaction_params_without_group_id)
      @new_transaction.group_id = session[:group_id]
    else
      @new_transaction = current_user.entities.new(transaction_params)
    end

    if @new_transaction.save

      flash[:notice] = "New transcation added successfully"
      redirect_to single_group_path(@new_transaction.group_id)
    else
      render :new
    end
  end

  private

  def transaction_params_without_group_id
    params.require(:entite).permit(:name, :amount)
  end

  def transaction_params
    params.require(:entite).permit(:name, :amount, :group_id)
  end
end
