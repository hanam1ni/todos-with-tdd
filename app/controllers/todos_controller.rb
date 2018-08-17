class TodosController < ApplicationController
  before_action :authenticate, only: [:index, :create]

  def index
    @todos = current_user.todos
  end

  def new
    @todo = Todo.new
  end

  def create
    Todo.new(todo_params).save
    redirect_to todos_path
  end

  private

  def todo_params
    params.require(:todo).permit(:title).merge(user_id: current_user.id)
  end
end