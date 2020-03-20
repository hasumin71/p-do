class Api::TasksController < ApplicationController

  def index


    @group = Group.find(params[:group_id]) 

    last_task_id = params[:id].to_i

#グループ内のメッセージでlast_idよりも大きいidのメッセージがないかを探してきてそれらを@messageに代入
    @tasks = @group.tasks.includes(:user).where('id > ?', params[:last_task_id])
  end
end