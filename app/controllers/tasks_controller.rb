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
    if params[:search_name].present? && params[:status].present?
      @tasks = Task.search_name(params[:search_name]).search_status(params[:status])
      # @tasks = Task.search_name_status(params[:search_name], params[:status])
    elsif params[:search_name].present? 
      @tasks = Task.search_name(params[:search_name])
    elsif params[:status].present? 
      @tasks = Task.search_status(params[:status])
    elsif params[:sort_deadline]
      @tasks = Task.order("due_date ASC") 
    elsif params[:sort_priority]
      @tasks = Task.order("priority DESC")
    else
      @tasks = Task.order("created_at DESC")
    end
    @tasks = @tasks.page(params[:page]).per(10)
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
