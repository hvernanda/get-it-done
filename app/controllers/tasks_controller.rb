class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params) #instead of @task = Task.new(:task)

    if @task.save
        redirect_to tasks_path
      else
        render :new
    end
    #karena jika di console "save" mengembalikan nilai false
  end

  private

  def task_params #supaya parameter lebih kuat menghindari is_admin = true
    params.require(:task).permit(:title,:description)
  end
end
