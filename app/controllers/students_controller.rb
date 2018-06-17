class StudentsController < ApplicationController
  def new
  end

  def create
  end

  def edit
  end

  def update
  end
  private 
  def student_params(*arg)
    params.require(:student).permit(*args)
  end
end
