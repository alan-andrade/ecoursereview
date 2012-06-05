#Udacity Crawler
#Professor - :name, :image_url, :bio
#Course - :provider, :subject, :title, :url, :average_rating, :youtube_url, :description, :level, :image_url, :course_code

require 'typhoeus'
require 'json'
require 'cgi'

class UdacityCrawler < ActiveRecord::Base
    
    PROVIDER = 'Udacity'
    
    def self.get_course_info(courses)
        courses.each do |course|
            
            #add course
            params = {:provider => PROVIDER}
            title = course['title'] 
            name = course['name']
            params[:title] = "#{name}: #{title}"
            params[:cours_code] = course['course_id']
            url_path = course['path']
            params[:url] = "http://www.udacity.com/overview/#{url_path}"
            youtube_id = course['teaser']['youtube_id']
            params[:youtube_url] = "http://www.youtube.com/watch?v=#{youtube_id}"
            params[:subject] = course['tags']['baseSubject']
            params[:description] = CGI.escape(course['description'])
            params[:level] = course['tags']['difficulty']
            params[:image_url] = course['icon_url']
            course = Course.new(params)
            p course
            
            #add professor
            instructors = course['instructors']
            instructors.each do |instructor|
                params = {}
                params[:name] = instructor['name'] 
                photo_url = instructor['headshot_url']
                params[:image_url] = "http://www.udacity.com#{photo_url}"
                params[:bio] = CGI.escape(instructor['bio'])
                #p params
                
                #add relationship
            end
        end
    end
    
    def self.parse_udacity(url)
        response = Typhoeus::Request.get(url)
        all_courses = JSON.parse(response.body)
        courses = all_courses['payload']['courses']
        UdacityCrawler.get_course_info(courses)
    end
    
    def self.get_udacity_courses
        url = 'http://www.udacity.com/ajax?{"data":{},"method":"course.get_available"}'
        udacity_url = URI.encode(url)
        begin
            UdacityCrawler.parse_udacity(udacity_url)
        rescue Exception => e
           puts e
           UdacityCrawler.parse_udacity(udacity_url)     
        end 
    end
    
    UdacityCrawler.get_udacity_courses
end