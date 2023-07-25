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

images = ["Auto.png","Account.png","Baby.png", "Banana.png" , "Cube.png", "Dance.png","Greens.png", "Web.png","Yoga.png"]

10.times do |index|
  img = images.sample
  img_path = Rails.root.join('db', 'images', img)
  recruiter_account = Recruiter.create(
    company_name: Faker::Company.name  ,
    email: "recruiter#{index+1}@gmail.com",
    password: "123456",
    # company_logo: 
    # birth_day: "01-04-199#{index}",
    # first_name: "User #{index+1}",
    # last_name: "User last name #{index+1}"
  )
  recruiter_account.company_logo.attach(io: File.open(img_path), filename: img)
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
    mandatory: Faker::Lorem.paragraph_by_chars(number: 240) ,
    optional_req: Faker::Lorem.paragraph_by_chars(number: 240) ,
    about: Faker::Lorem.paragraph_by_chars(number: 240) ,
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

30.times do |index|
  applications = Application.create(
    experience: Faker::Lorem.paragraph_by_chars(number: 400),
    why_interested: Faker::Lorem.paragraph_by_chars(number: 400) ,
    job_id: Job.all.ids.sample,
    professional_id: Professional.all.ids.sample,
  )
  if applications.save
    print "."
  else
    puts ""
    puts "F"
    puts applications.errors.full_messages.join(", ")
  end
end

20.times { follows = Follow.create(professional: Professional.all.sample, followable: Job.all.sample)
  if follows.save
    print "."
  else
    puts ""
    puts "F"
    puts follows.errors.full_messages.join(", ")
  end
}

20.times { follows = Follow.create(professional: Professional.all.sample, followable: Recruiter.all.sample)
  if follows.save
    print "."
  else
    puts ""
    puts "F"
    puts follows.errors.full_messages.join(", ")
  end
}
# follow = Follow.create(professional: current_professional, followable: recruiter)


# 15.times { Like.create(user:user1, tweet: Tweet.all.sample) }