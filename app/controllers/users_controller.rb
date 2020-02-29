class UsersController < ApplicationController
 
  
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

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
