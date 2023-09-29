# frozen_string_literal: true

module Api
  module V1
    class StudentsController < ApplicationController
      before_action :set_student, only: %i[show update destroy]

      # GET /students
      def index
        page = params[:page] || 1
        per_page = params[:per_page] || 10

        start_index = (page.to_i - 1) * per_page.to_i

        student_courses = @result.enrollments.offset(start_index).limit(per_page).map(&:course)

        result = {
          page: page.to_i,
          per_page: per_page.to_i,
          total_count: student_courses.size,
          course_data: Course.students_names(student_courses),
          total_students: student_courses.map(&:students).flatten.count
        }

        render json: result, head: :ok
      end

      # GET /students/1
      def show
        render json: @student
      end

      # POST /students
      def create
        @student = Student.new(student_params)

        if @student.save!
          render json: @student.id, head: :created
        else
          render json: @student.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /students/1
      def update
        if @student.update(student_params)
          render json: @student
        else
          render json: @student.errors, status: :unprocessable_entity
        end
      end

      # DELETE /students/1
      def destroy
        @student.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_student
        @student = Student.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def student_params
        params.require(:student).permit(
          :name,
          :email,
          :password_digest
        )
      end
    end
  end
end
