class EntityController < ApplicationController
  before_action :authenticate_user!

  def index
    @transactions = current_user.groups.includes(:entities).order('created_at DESC').all
  end

  def new
    @entity = Entite.new
    @groups = Group.all
  end

  def show
    @groups = Group.all
  end

  def create
    if session[:is_transaction_triggered_from_detail] && transaction_params_without_group_id[:name] && transaction_params_without_group_id[:amount]
      @new_transaction = current_user.entities.new(transaction_params_without_group_id)
      @new_transaction.group_id = session[:group_id]
      persist_data(@new_transaction)

    elsif transaction_params[:name] && transaction_params[:amount] && transaction_params[:group_id]
      @new_transaction = current_user.entities.new(transaction_params)
      persist_data(@new_transaction)
    else
      @groups = Group.all
      flash[:notice] = "Please fill in the entire form"
      render :new
    end
  end

  def edit
    @entity = Entite.find(params[:id])
    @groups = Group.all
  end

  def update
    @entity = Entite.find(params[:id])

    if @entity.update(transaction_params)
      flash[:notice] = "Transaction updated successfully"
      redirect_to single_group_path(@entity.group_id)
    else
      @groups = Group.all
      render :edit
    end
  end

  def destroy
    @entity = Entite.find(params[:id])

    # keep a copy of the deleted entity group
    @group_id = @entity.group_id
    @entity.destroy

    flash[:notice] = 'Transaction deleted'
    redirect_to single_group_path(@group_id)
  end

  private

  def transaction_params_without_group_id
    params.permit(:name, :amount)
  end

  def transaction_params
    params.permit(:name, :amount, :group_id)
  end

  def persist_data(instance_variable)
    if instance_variable.save
      flash[:notice] = "New transcation added successfully"
      redirect_to single_group_path(instance_variable.group_id)
    else
      @groups = Group.all
      render :new
    end
  end
end
