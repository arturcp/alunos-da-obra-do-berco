# frozen_string_literal: true

class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def download
    student = Student.find(params[:id])

    send_data Base64.decode64(student.cv), type: 'application/pdf', filename: "CV_#{student.name}", status: 200
  end
end
