class CoursesController < ApplicationController
 
  def index
        
    @courses = Course.order('title').page(params[:page]).per(5) 
    all_courses = Course.all
    @subjects = Hash.new #{subject => # of courses}
    all_courses.each do |course|
        
        subject = course[:subject]
        if @subjects.has_key?(subject)
            @subjects[subject] += 1
        else
           @subjects[subject] = 1 
        end
    end
    
    @subjects = Hash[@subjects.sort] #sort subjects alphabetically
    
    @subject_count = all_courses.count
    
  end

  # GET /:provider/:slug
  def show
    @course = Course.find_by_slug(params[:slug])
  end

  # GET /:subject
  def subject
      subject = params[:subject].titleize
      subject = "Computer Science" if subject == 'Computer'
      @courses = Course.where(:subject => subject).order('title').page(params[:page]).per(5)
      @subjects = {subject => @courses.count}
      @subject_count = Course.all.count
      render "courses/index"
  end
  
end
