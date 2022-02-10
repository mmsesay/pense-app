class UserController < ApplicationController
  def edit
    @user = current_user
    render "users/registrations/edit"
  end
end
