desc "The Heroku Scheduler collects course information from around the web"
task :get_udacity_courses => :environment do
    puts "Getting Udacity Courses"
    Course.get_udacity_courses
    puts "got Udacity courses"
end