class CourseController < ApplicationController
  
  #create course
  def create
    @teacher = current_user
    if @teacher.user_type == 2 or @teacher.user_type == 3
      @course = Course.new
      @course.name = params[:name]
      @course.teacher_id = @teacher.id
      @course.join_code = nil
      if @course.save
        redirect_to "/courses/view/#{@course.id}"
      else
        redirect_to "/users/view/#{teacher.id}"
      end
    else
      redirect_to "/users/view/#{teacher.id}"
    end
  end
  
  #view course page
  def view
    @course = Course.find_by(id: params[:id])
    render "view"
  end
  
  #edit course
  def edit
    
  end
  
  #update course from edit page
  def update
    
  end
  
  #teacher manually add student or through join code
  #create enrollment for user to add them
  def add_student
    
  end
  
  #teacher removes student
  def remove_student
    
  end
  
  #enable and generate join code
  def enable_join_code
    
  end
  
  #disable join code by setting to nil
  def disable_join_code
    
  end
end