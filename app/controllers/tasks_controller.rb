class TasksController < ApplicationController
  before_action :set_group

  def index
    @task = Task.new
    @tasks = @group.tasks.includes(:user)
  end

  def create
    @task = @group.tasks.new(task_params)
    if @task.save
      respond_to do |format|
        format.json
      end   
    else
      @tasks = @group.tasks.includes(:user)
      flash.now[:alert] = 'メッセージを入力してください。'
      render :index
    end
  end

  def destroy 
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to group_tasks_path
  end  
  private

  def task_params
    params.require(:task).permit(:content).merge(user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

end

