class RatingsController < ApplicationController
  def create
    @course = Course.find_by_slug(params[:slug])
=begin    
    if @course.rate_it(params[:rating][@course.id.to_s], current_user.id)
      respond_to do |format|
        format.html { redirect_to post_path(@course.post) }
        format.js
      end      
    end
=end
  end
end