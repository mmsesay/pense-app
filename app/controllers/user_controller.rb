class UserController < ApplicationController
  load_and_authorize_resource
  def edit
    @user = current_user
    render "users/registrations/edit"
  end
end
