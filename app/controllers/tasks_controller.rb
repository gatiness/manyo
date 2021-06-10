class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]

  def new
    @task = Task.new
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    # @task = Task.new(task_params)
    # @task.user_id = current_user.id
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

  def index
    @tasks = Task.where(user_id: current_user.id).includes(:user)
    if params[:search_name].present? && params[:status].present?
      @tasks = current_user.tasks.search_name(params[:search_name]).search_status(params[:status])
      # @tasks = Task.search_name_status(params[:search_name], params[:status])
    elsif params[:search_name].present? 
      @tasks = current_user.tasks.search_name(params[:search_name])
    elsif params[:status].present? 
      @tasks = current_user.tasks.search_status(params[:status])
    elsif params[:sort_deadline]
      @tasks = current_user.tasks.order("due_date ASC") 
    elsif params[:sort_priority]
      @tasks = current_user.tasks.order("priority DESC")
    else
      @tasks = current_user.tasks.order("created_at DESC")
    if params[:label_id].present?
      @tasks = current_user.tasks.search_label(params[:label_id] )
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
