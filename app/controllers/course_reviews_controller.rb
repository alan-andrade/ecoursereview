class CourseReviewsController < ApplicationController
    def new
        @course = Course.find_by_slug(params[:slug])
        @course_review = CourseReview.new
    end
    
    def create 
       p params
       course_id = params["course_id"]
       text = params["course_review"]
       rating = params['rating']
       params = { :course_id => course_id,
                  :user_id => current_user.id,
                  :text => text["text"],
                  :rating => rating[course_id]
       }
       course_review = CourseReview.new(params)
       course_review.save
       
       average_rating = CourseReview.where(:course_id => course_id).average(:rating).to_f
       p course = Course.find_by_id(course_id)
       course.average_rating = average_rating
       p course.save
       
       
       redirect_to root_path
       flash[:success] = "Your review has been saved!"
       
    end
end
