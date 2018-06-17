class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  def index
    @students = Student.all
  end
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params(:first_name, :last_name))
    @student.save 
    redirect_to student_path(@student)
  end

  def edit
  end

  def update
    @student = Student.find(params[:id])
    @student.update(student_params(:first_name, :last_name))
    redirect_to student_path (@student)
  end
  private
  def student_params(*arg)
    params.require(:student).permit(*args)
  end
end
