class TodosController < ApplicationController
  before_action :authenticate, only: [:index, :create]

  def index
    current_user = session[:current_user]['id']

    @todos = Todo.where(user_id: current_user)
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
    current_user = session[:current_user]['id']

    params.require(:todo).permit(:title).merge(user_id: current_user)
  end
end