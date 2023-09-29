Rails.application.routes.draw do
  # API V1
  namespace :api do
    namespace :v1 do
      resources :students, :courses, :instructors

      # student sessions
      post 'student_sessions/login', to: 'student_sessions#create'
      delete 'student_sessions/logout', to: 'student_sessions#destroy'

      # instructor sessions
      post 'instructor_sessions/login', to: 'instructor_sessions#create'
      delete 'instructor_sessions/logout', to: 'instructor_sessions#destroy'

      # get '/tasks', to: 'courses#list_tasks'
      # get '/check_tasks', to: 'courses#check_tasks'
      # get '/generate_tasks_report', to: 'courses#generate_tasks_report'
    end
  end
end
