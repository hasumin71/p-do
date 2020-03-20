class UsersController < ApplicationController
 
  def index
    @users = User.search(params[:keyword], current_user.id)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show

    @user = User.find(params[:id])
    tasks = @user.tasks 
    @tasks = []
    tasks.each do |t|
      if t.group_id.to_s == params[:group_id].to_s
        @tasks << t
      end      
    end  
    return @tasks
  end    
  
  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy 
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to group_user_path
  end 

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
