# frozen_string_literal: true

module Api
  module V1
    class CoursesController < ApplicationController
      # before_action :authorize
      before_action :set_course, only: %i[show update destroy]

      # GET /courses
      def index
        page = params[:page] || 1
        per_page = params[:per_page] || 10

        start_index = (page.to_i - 1) * per_page.to_i

        courses = Course.all.order(id: :desc).offset(start_index).limit(per_page)

        render json: {
          page: page.to_i,
          per_page: per_page.to_i,
          total_count: Course.count,
          courses: courses
        }, head: :ok

        # render json: courses.last.enrollments.map(&:enrollable)
      end

      # # GET /tasks
      # def list_tasks
      #   @tasks = []
      #   @student.courses.each { |t| @tasks << t.tasks }
      #   render json: @tasks
      # end

      # # GET /check_tasks
      # def check_tasks
      #   @instructor_tasks = []
      #   @instructor.courses.each { |t| @instructor_tasks << t.tasks }
      #   render json: @instructor_tasks
      # end

      # GET /courses/1
      def show
        render json: @course
      end

      # POST /courses
      def create
        @course = Course.new(course_params.merge(student: @student))

        if @course.save
          render json: @course, status: :created, location: @course
        else
          render json: @course.errors, status: :unprocessable_entity
        end
      end

      # # GET /generate_tasks_report
      # def generate_tasks_report
      #   send_data(GenerateTasksReportJob.perform_now, disposition: %(attachment; filename=tasks_report.xlsx))
      # end

      # PATCH/PUT /courses/1
      def update
        if @course.update(course_params)
          render json: @course
        else
          render json: @course.errors, status: :unprocessable_entity
        end
      end

      # DELETE /courses/1
      def destroy
        @course.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_course
        @course = Course.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def course_params
        params.require(:course).permit(
          :semester_id,
          :teaching_level_id,
          :name,
          :description
        )
      end
    end
  end
end
