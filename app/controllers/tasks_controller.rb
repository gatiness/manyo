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
  
  def update
    if @task.update
      redirect_to tasks_path, notice: "タスクをアップデートしました！"
    else
      render :new
    end
  end

  def new
    @task = Task.new
  end

  def index
    @tasks = Task.all
  end

  def show
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:task_name, :task_description)
  end

end
