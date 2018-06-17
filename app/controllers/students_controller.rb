class StudentsController < ApplicationController
  def new
  end

  def create
  end

  def edit
  end

  def update
    @student = Student.find(params[:id])
    @student.update(student_params(:first_name, :last_name))
  end
  private
  def student_params(*arg)
    params.require(:student).permit(*args)
  end
end
