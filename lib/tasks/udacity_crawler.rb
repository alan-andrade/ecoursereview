#Udacity Crawler
#Professor - :course_id, :name, :image_url, :bio
#Course - :provider, :subject, :title, :url, :average_rating, :youtube_url, :description, :level, :image_url, :course_code

require 'typhoeus'
require 'json'
require 'cgi'

class Crawlers
    
    #catch JSON parse error
    
    provider = 'Udacity'
    base_url = "http://www.udacity.com"
    url = 'http://www.udacity.com/ajax?{"data":{},"method":"course.get_available"}'
    udacity_url = URI.encode(url)
    response = Typhoeus::Request.get(udacity_url)
    all_courses = JSON.parse(response.body)
    courses = all_courses['payload']['courses']
    courses.each do |course|
       title = course['title'] 
       name = course['name']
       course_id = course['course_id']
       full_title = "#{name}: #{title} (#{course_id})"
       instructors = course['instructors']
       instructors.each do |instructor|
          instructor['name'] 
          photo_url = instructor['headshot_url']
          full_photo_url = "#{base_url}#{photo_url}"
          bio = CGI.escape(instructor['bio'])
       end
       path = course['path']
       course_url = "http://www.udacity.com/overview/#{path}"
       youtube_id = course['teaser']['youtube_id']
       youtube_url = "http://www.youtube.com/watch?v=#{youtube_id}"
       subject = course['tags']['baseSubject']
       description = CGI.escape(course['description'])
       level = course['tags']['difficulty']
       image_url = course['icon_url']
    end
end