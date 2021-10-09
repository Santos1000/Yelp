class TasksController < ApplicationController
  def index
    raise
    @tasks = Task.all
  end

  def new
    @task = Task.new(params[:tasks])
    @task.save
  end

  def create
    @task = Task.new(params[:tasks])
    @task.save

    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Tasks.find(params[:id])
    @task.update(tasks_params)

    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to tasks_path
  end

  private

  def tasks_params
    params.require(:task).permit(:title, :detail, :completed)
  end
end
