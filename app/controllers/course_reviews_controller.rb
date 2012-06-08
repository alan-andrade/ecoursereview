class CourseReviewsController < ApplicationController
    def create
        @course_review = CourseReview.new
        if @course_review.save
              #sign_in @user
              #flash[:success] = "Your review has been successfully submitted!"
              redirect_to root_path
        else
            render 'new'
        end
    end
end
