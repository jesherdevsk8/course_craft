# frozen_string_literal: true

[
  { name: 'Inglês Básico', slug: 'ingles-basico', description: 'Gramática de uso da língua inglesa' },
  { name: 'Inglês Intermediário', slug: 'ingles-intermediario', description: 'Conversação da língua inglesa' }
].each do |course|
  Course.create!(name: course[:name], slug: course[:slug], description: course[:description])
end

ingles_basico = Course.find_by(slug: 'ingles-basico')
ingles_intermediario = Course.find_by(slug: 'ingles-intermediario')

[
  { name: 'Julia Torvalds', email: 'juliatorvalds@hulu.com', password: 'senha@123' },
  { name: 'John Mayer', email: 'mayer@hulu.com', password: 'senha@456' }
].each do |student|
  Student.create!(name: student[:name], email: student[:email], password: student[:password])
end

[
  { name: 'Sr. Smith Sanchez', email: 'smithsanchez@hulu.com', password: '123@mudar' },
  { name: 'Sra. McDonald', email: 'mcdonald@hulu.com', password: '456@mudar' }
].each do |instructor|
  Instructor.create!(name: instructor[:name], email: instructor[:email], password: instructor[:password])
end

[
  { codigo: 'Lvl1', description: 'Nível 1' },
  { codigo: 'Lvl2', description: 'Nível 2' }
].each do |lvl|
  TeachingLevel.create!(codigo: lvl[:codigo], description: lvl[:description])
end

[
  { current_semester: '2023/01', current_semester_code: 'S1', description: 'Primavera' },
  { current_semester: '2023/02', current_semester_code: 'S2', description: 'Verão' }
].each do |semester|
  Semester.create!(current_semester: semester[:current_semester],
                   current_semester_code: semester[:current_semester_code], description: semester[:description])
end

# matriculas ingles basico
Enrollment.create(enrollable: Instructor.first, course: ingles_basico)
Enrollment.create(enrollable: Student.second, course: ingles_basico)
Enrollment.create(enrollable: Semester.first, course: ingles_basico)
Enrollment.create(enrollable: TeachingLevel.first, course: ingles_basico)
# ingles_basico.enrollments.enrollments
# ingles_basico.enrollments.map(&:enrollable)

# matriculas ingles intermediario
Enrollment.create(enrollable: Instructor.second, course: ingles_intermediario)
Enrollment.create(enrollable: Student.first, course: ingles_intermediario)
Enrollment.create(enrollable: Student.second, course: ingles_intermediario)
Enrollment.create(enrollable: Semester.second, course: ingles_intermediario)
Enrollment.create(enrollable: TeachingLevel.second, course: ingles_intermediario)

# gerar relatorio de tarefas
# Task.create!( course_id: 1, description: 'Tarefa 1 (Teste Gramatical)', task_note: '95')

# Task.create!( course_id: 1, description: 'Tarefa 2 (Teste conversação)', task_note: '')
