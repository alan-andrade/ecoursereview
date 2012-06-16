class CourseReviewsController < ApplicationController
    def new
        @course = Course.find_by_slug(params[:slug])
        @course_review = CourseReview.new
    end
    
    def create 
       p params
       
       course_id = params["course_id"]
       text      = params["course_review"]
       rating    = params['rating']
       course = Course.find_by_id(course_id)

       if text["text"].length > 6 and rating[course_id].to_i > 0
          params = { :course_id => course_id,
                  :user_id => current_user.id,
                  :text => text["text"],
                  :rating => rating[course_id]
          }
          course_review = CourseReview.new(params)
          course_review.save
       
          average_rating = CourseReview.where(:course_id => course_id).average(:rating).to_f
          course.average_rating = average_rating
          course.save
           
         
           redirect_to "/#{course.provider}/#{course.slug}"
           flash[:success] = "Thanks for adding your review #{current_user.name}. Keep Learning!"
       else 
          flash[:error] = 'Oh no! Your review was not saved. Please make sure to add at least one star and some text to your review :)' 
          redirect_to "/review/new/#{course.slug}"            
       end
       
    end
end
