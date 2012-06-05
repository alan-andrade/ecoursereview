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
#  average_rating :integer
#  youtube_url    :string(255)
#  description    :text
#  level          :string(255)
#  image_url      :string(255)
#  course_code    :string(255)
#

class Course < ActiveRecord::Base
  attr_accessible :provider, :subject, :title, :url, :average_rating, :youtube_url, :description, :level, :image_url, :course_code
  validates_uniqueness_of :title, :scope => :provider
  has_many :professors, through: :relationships
  has_many :relationships, foreign_key: "professor_id", dependent: :destroy
  

      def self.get_course_info(courses)
          courses.each do |course|

              #add course
              params = {:provider => 'Udacity'}
              title = course['title'] 
              name = course['name']
              @full_title = "#{name}: #{title}"
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
              
              #if course already exists
              if @course_id == nil
                  existing_course = Course.find_by_title(@full_title)
                  @course_id = existing_course.id
              end

              #add professor
              instructors = course['instructors']
              instructors.each do |instructor|
                  params = {}
                  params[:name] = instructor['name'] 
                  photo_url = instructor['headshot_url']
                  params[:image_url] = "http://www.udacity.com#{photo_url}"
                  params[:bio] = CGI.escape(instructor['bio'])
                  professor = Professor.new(params)
                  professor.save
                  @professor_id = professor.id
                  
                  #if professor already exists 
                  if @professor_id == nil
                    professor = Professor.find_by_name(instructor['name'])
                    @professor_id = professor.id 
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
          Course.get_course_info(courses)
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
  
end
