class CoursesController < ApplicationController
  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all

    @subjects = Hash.new #{subject => # of courses}
    @courses.each do |course|
        
        subject = course[:subject]
        if @subjects.has_key?(subject)
            @subjects[subject] += 1
        else
           @subjects[subject] = 1 
        end
    end
    
    @subjects = Hash[@subjects.sort] #sort subjects alphabetically
    
    @subject_count = 0
    @subjects.each_value do |num|
       @subject_count += num 
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @courses }
    end
    
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course }
    end
    
    @subjects = Hash.new #{subject => # of courses}
    @courses.each do |course|
        
        subject = course[:subject]
        if @subjects.has_key?(subject)
            @subjects[subject] += 1
        else
           @subjects[subject] = 1 
        end
    end
    
    p @subjects
  end

end
