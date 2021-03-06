class UsersController < ApplicationController
  #authorizes specific method views
  before_filter :authorize, :only => [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to('/users')
    else
      redirect_to('/users/new')
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to('/')
    else
      redirect_to("/users/#{@user.id}")
    end
  end #update

  def destroy
    @user = User.find(params[:id])
    redirect_to('/logout')
    @user.destroy
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :image_url,
      :password_confirmation
    )
  end
end #class
