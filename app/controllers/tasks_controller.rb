class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "タスクを作成しました！"
    else
      render :new 
    end
  end
  
  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to task_path, notice: "タスクをアップデートしました！"
    else
      render :new
    end
  end

  def new
    @task = Task.new
  end

  def index
    @tasks = Task.all
    @tasks = Task.all.order("id DESC")
  end

  def show
  end

  def destroy 
    @task.destroy
    redirect_to tasks_path, notice: "タスクを削除しました！"
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:task_name, :task_description)
  end



end
