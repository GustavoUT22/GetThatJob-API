require 'faker'

puts "Create New Professionals"

puts Faker::Name.name 

Professional.destroy_all
Recruiter.destroy_all
Job.destroy_all
Application.destroy_all
Follow.destroy_all

ActiveRecord::Base.connection.reset_pk_sequence!('professionals')
ActiveRecord::Base.connection.reset_pk_sequence!('recruiters')
ActiveRecord::Base.connection.reset_pk_sequence!('jobs')
ActiveRecord::Base.connection.reset_pk_sequence!('applications')
ActiveRecord::Base.connection.reset_pk_sequence!('follows')

10.times do |index|
  professional_account = Professional.create(
    name: "User #{index+1}",
    email: "user#{index+1}@gmail.com",
    password: "123456"
    # birth_day: "01-04-199#{index}",
    # first_name: "User #{index+1}",
    # last_name: "User last name #{index+1}"
  )
  if professional_account.save
    print "."
  else
    puts ""
    puts "F"
    puts professional_account.errors.full_messages.join(", ")
  end
end

puts "Create New Professionals"

10.times do |index|
  recruiter_account = Recruiter.create(
    company_name: Faker::Company.name  ,
    email: "recruiter#{index+1}@gmail.com",
    password: "123456",
    # birth_day: "01-04-199#{index}",
    # first_name: "User #{index+1}",
    # last_name: "User last name #{index+1}"
  )
  if recruiter_account.save
    print "."
  else
    puts ""
    puts "F"
    puts recruiter_account.errors.full_messages.join(", ")
  end
end

puts "Create New Jobs"

jobs_category = ["Manufacturing", "Legal", "Education", "Goverment", "Sales"]
# 10.times do |index|
#   recruiter_account = Recruiter.create(
#     company_name: Faker::Company.name  ,
#     email: "recruiter#{index+1}@gmail.com",
#     password: "123456",
#    # password_digest: "123456", 
#     category: jobs_category.sample,
#     # birth_day: "01-04-199#{index}",
#     # first_name: "User #{index+1}",
#     # last_name: "User last name #{index+1}"
#   )
#   if recruiter_account.save
#     print "."
#   else
#     puts ""
#     puts "F"
#     puts recruiter_account.errors.full_messages.join(", ")
#   end
# end

jobs_type = ["Full Time", "Part Time", "Internship"]

20.times do |index|
  jobs = Job.create(
    title: Faker::Job.title,
    category: jobs_category.sample,
    job_type: jobs_type.sample,
    salary: rand(1000..5000),
    mandatory: Faker::Lorem.paragraphs(number: 1) ,
    optional_req: Faker::Lorem.paragraphs(number: 1) ,
    about: Faker::Lorem.paragraphs(number: 1) ,
    recruiter_id: Recruiter.all.ids.sample,
  )
  if jobs.save
    print "."
  else
    puts ""
    puts "F"
    puts jobs.errors.full_messages.join(", ")
  end
end

