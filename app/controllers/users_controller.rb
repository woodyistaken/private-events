class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @events=current_user.created_events.all
    @user=current_user
  end
end
