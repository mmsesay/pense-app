class SplashController < ApplicationController
  before_action :check_signed_in

  def index; end

  def check_signed_in
    redirect_to group_path if signed_in?
  end
end
