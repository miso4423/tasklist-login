class TasksController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all
  end

  def show
    
  end

  def new
    @user = User.new
  end

  def create
    @user = current_user.users.build(user_params)
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "タスクが正常に記録されました"
      redirect_to @user
    else
      flash.now[:danger] = "タスクが記録されませんでした"
      render :new
    end
  end

  def edit
    
  end

  def update
    
    if @user.update(user_params)
      flash[:success] = "Task は正常に更新されました"
      redirect_to @user
    else
      flash[:danger] = "Task は正常に更新されませんでした"
      render :edit
    end
  end

  def destroy
    
    @user.destroy
    flash[:success] = "Task は正常に削除されました"
    redirect_to users_url
    
  end
  
  private
  
  def set_user
    @user = user.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:content, :status)
  end
  
  def correct_user
    @user = current_user.users.find_by(id: params[:id])
    unless @user
      redirect_to root_url
    end
  end
end

