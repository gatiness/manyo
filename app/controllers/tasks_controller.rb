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
    if params[:sort_deadline]
      @tasks = Task.order("due_date ASC")
    else
      @tasks = Task.order("id DESC")
    end
    if params[:sort_priority]
      @tasks = Task.order("priority DESC")
    end
    if params[:search_name]
      @tasks = Task.where('name LIKE ?', "%#{params[:search]}%") if params[:search].present?
    end
    if params[:status]
      @tasks = Task.where(status: params[:status])
    end
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
    params.require(:task).permit(:name, :description, :due_date, :status, :priority)
  end
end
