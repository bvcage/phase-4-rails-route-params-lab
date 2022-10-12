class StudentsController < ApplicationController

  def index
    students = Student.all
    if params[:name]
      first_name_matches = students.where("first_name LIKE ?", "%#{params[:name]}%")
      last_name_matches = students.where("last_name LIKE ?", "%#{params[:name]}%")
      students = first_name_matches + last_name_matches
    end
    render json: students
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end

end
