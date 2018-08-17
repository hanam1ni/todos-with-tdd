class CompletionsController < ApplicationController
  def create
    Todo.find(params[:todo_id]).touch :completed_at
    redirect_to todos_path
  end
end