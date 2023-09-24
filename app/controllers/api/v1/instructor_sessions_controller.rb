# frozen_string_literal: true

module Api
  module V1
    class InstructorSessionsController < ApplicationController
      def create
        @instructor = Instructor.find_by(email: instructor_params[:email])

        if @instructor&.authenticate_password(instructor_params[:password])
          token = generate_jwt_token(
            { id: @instructor.id, class_name: @instructor.class.name, name: @instructor.name,
              email: @instructor.email }
          )

          render json: { token: token }, head: :created
        else
          head :unprocessable_entity
        end
      end

      def destroy
        # implementing this
      end

      private

      def instructor_params
        params.require(:instructor_session).permit(:email, :password)
      end
    end
  end
end
