# == Schema Information
#
# Table name: courses
#
#  id             :integer         not null, primary key
#  provider       :string(255)
#  title          :string(255)
#  url            :string(255)
#  subject        :string(255)
#  created_at     :datetime        not null
#  updated_at     :datetime        not null
#  average_rating :float
#  youtube_url    :string(255)
#  description    :text
#  level          :string(255)
#  image_url      :string(255)
#  course_code    :string(255)
#  price          :integer
#  slug           :string(255)
#  short_url      :string(255)
#

class Course < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged #generates a url based on title
  attr_accessible :provider, :subject, :title, :url, :average_rating, :youtube_url, :description, :level, :image_url, :course_code, :price, :slug, :short_url
  validates_uniqueness_of :title, :scope => :provider
  validates_uniqueness_of :slug, :scope => :provider
  has_many :professors, through: :relationships
  has_many :relationships, foreign_key: "professor_id", dependent: :destroy
  has_many :reviews
  

      def self.get_udacity_course_info(courses)
          courses.each do |course|

              #add course
              params = {:provider => 'Udacity',
                        :price => 0,
                        :average_rating => 0 }
              title = course['title'] 
              name = course['name']
              @full_title = "#{name}: #{title}"
              @course_id = 0
              existing_course = Course.find_by_title(@full_title)
              if existing_course == nil
                  params[:title] = @full_title
                  params[:course_code] = course['course_id']
                  url_path = course['path']
                  params[:url] = "http://www.udacity.com/overview/#{url_path}"
                  youtube_id = course['teaser']['youtube_id']
                  params[:youtube_url] = "http://www.youtube.com/watch?v=#{youtube_id}"
                  params[:subject] = course['tags']['baseSubject']
                  params[:description] = CGI.escape(course['description'])
                  params[:level] = course['tags']['difficulty']
                  params[:image_url] = course['icon_url']
                  p params
                  udacity_course = Course.new(params)
                  udacity_course.save
                  @course_id = udacity_course.id
              else
                  @course_id = existing_course.id
              end

              #add professor
              instructors = course['instructors']
              instructors.each do |instructor|
                  params = {}
                  @name = instructor['name'] 
                  @professor_id = 0
                  existing_instructor = Professor.find_by_name(@name)
                  if existing_instructor == nil
                      params[:name] = @name
                      photo_url = instructor['headshot_url']
                      params[:image_url] = "http://www.udacity.com#{photo_url}"
                      params[:bio] = CGI.escape(instructor['bio'])
                      professor = Professor.new(params)
                      professor.save
                      @professor_id = professor.id
                  else
                    @professor_id = existing_instructor.id 
                  end
                        
                          
                  #add relationship
                  relationship = Relationship.new({:course_id => @course_id,
                                                  :professor_id => @professor_id})
                  relationship.save                                  
              end
          end
      end

      def self.parse_udacity(url)
          response = Typhoeus::Request.get(url)
          all_courses = JSON.parse(response.body)
          courses = all_courses['payload']['courses']
          Course.get_udacity_course_info(courses)
      end

      def self.get_udacity_courses
          url = 'http://www.udacity.com/ajax?{"data":{},"method":"course.get_available"}'
          udacity_url = URI.encode(url)
          begin
              Course.parse_udacity(udacity_url)
          rescue Exception => e
             puts e
             Course.parse_udacity(udacity_url)     
          end 
      end
      
      def self.shorten_course_urls
          Bitly.use_api_version_3
          bitly = Bitly.new(ENV['BITLY_USERNAME'], ENV['BITLY_APIKEY'])
          courses = Course.where(:short_url => nil)
          courses.each do |course|
              course.short_url = bitly.shorten(course.url).short_url
              course.save
              p course.short_url
          end 
      end
end
