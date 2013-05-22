class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to admin_users_path, :flash => { :success => "The user was successfully created" } 
    else
      render action: "new"
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_url, :flash => { :success => "The user was successfully deleted" } 
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to admin_users_url, :flash => { :success => "The user was successfully updated"}
    else
      render action: "edit"
    end
  end
end
