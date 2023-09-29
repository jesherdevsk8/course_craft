# frozen_string_literal: true

module Api
  module V1
    class InstructorsController < ApplicationController
      before_action :set_instructor, only: %i[show update destroy]

      # GET /instructors
      def index
        page = params[:page] || 1
        per_page = params[:per_page] || 10

        start_index = (page.to_i - 1) * per_page.to_i

        instructor_courses = @result.enrollments.offset(start_index).limit(per_page).map(&:course)

        result = {
          page: page.to_i,
          per_page: per_page.to_i,
          total_count: instructor_courses.size,
          course_data: Course.instructors_names(instructor_courses),
          total_instructors: instructor_courses.map(&:instructors).flatten.count
        }

        render json: result, head: :ok
      end

      # GET /instructors/1
      def show
        render json: @instructor
      end

      # POST /instructors
      def create
        @instructor = Instructor.new(instructor_params)

        if @instructor.save!
          render json: @instructor.id, head: :created
        else
          render json: @instructor.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /instructor/1
      def update
        if @instructor.update(instructor_params)
          render json: @instructor
        else
          render json: @instructor.errors, status: :unprocessable_entity
        end
      end

      # DELETE /instructor/1
      def destroy
        @instructor.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_instructor
        @instructor = Instructor.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def instructor_params
        params.require(:instructor).permit(
          :name,
          :email,
          :password_digest
        )
      end
    end
  end
end
