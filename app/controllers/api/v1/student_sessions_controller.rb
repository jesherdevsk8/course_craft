# frozen_string_literal: true

module Api
  module V1
    class StudentSessionsController < ApplicationController
      before_action :authorize, except: :create

      def create
        @student = Student.find_by(email: student_params[:email])

        if @student&.authenticate_password(student_params[:password])
          token = generate_jwt_token(
            { id: @student.id, class_name: @student.class.name, name: @student.name,
              email: @student.email }
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

      def student_params
        params.require(:student_session).permit(:email, :password)
      end
    end
  end
end
