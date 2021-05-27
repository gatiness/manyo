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
    @tasks = Task.order("created_at DESC")
    @tasks = Task.order("due_date ASC") if params[:sort_deadline]
    @tasks = Task.order("priority DESC") if params[:sort_priority]

    if params[:search_name].present? && params[:status].present?
      @tasks = Task.where('name LIKE ?', "%#{params[:search_name]}%").where(status: params[:status])
    elsif params[:search_name].present?
      @tasks = Task.where('name LIKE ?', "%#{params[:search_name]}%")
    elsif params[:status].present?
      @tasks = Task.where(status: params[:status])
    end
    @tasks = @tasks.page(params[:page])
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


# def where(title, priority, status)
# end

# def where(title: '', priority: 0, status: 'pending')
# end

# Task.where(status: 'pending')
# Task.all => [@task, @task1, @task2].where(name: 'a') => [@task1, @task2].where