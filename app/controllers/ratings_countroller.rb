class RatingsController < ApplicationController
  def create
    @course = Course.find_by_slug(params[:slug])
    if @course.rate_it(params[:rating][@course.id.to_s], current_user.id)
      respond_to do |format|
        format.html { redirect_to post_path(@course.post) :notice => "Your rating has been saved" }
        format.js
      end
    end
  end
end