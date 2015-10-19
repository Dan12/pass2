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
    @course = Course.find_by(id: params[:id])
    render "edit"
  end
  
  #update course from edit page
  def update
    @course = Course.find_by(id: params[:id])
    @teacher = current_user
    if @course and @course.teacher_id == @teacher.id
      @course.name = params[:name]
      if @course.name != nil and @course.name != ""
        @course.save
      end
      redirect_to "/courses/view/#{@course.id}"
    else
      redirect_to "/users/view/#{@teacher.id}"
    end
  end
  
  #teacher manually add student or through join code
  #create enrollment for user to add them
  def add_student
    #teacher added student
    if params[:join_code] == nil or params[:join_code] = ""
      @teacher = current_user
      if @teacher.user_type == 2 or @teacher.user_type = 3
        @course = Course.find_by(id: params[:course_id])
        if @course and @course.teacher_id = @teacher.id
          @student = User.find_by(id: params[:student_id])
          if @student and (@student.enrollments.where(course_id: @course.id) == nil or @student.enrollments.where(course_id: @course.id) == []) and @student.id != @teacher.id
            @enrollment = Enrollment.new
            @enrollment.course_id = @course.id
            @enrollment.user_id = @student.id
            @enrollment.save
            redirect_to "/courses/view/#{@course.id}"
          else
            redirect_to "/users/view/#{@teacher.id}"
          end
        else
          redirect_to "/users/view/#{@teacher.id}"
        end
      else
        redirect_to "/users/view/#{@teacher.id}"
      end
    #student joined with join code
    else
      
    end
  end
  
  #teacher removes student
  def remove_student
    @teacher = current_user
    if @teacher.user_type == 2 or @teacher.user_type = 3
      @course = Course.find_by(id: params[:course_id])
      if @course and @course.teacher_id = @teacher.id
        @student = User.find_by(id: params[:student_id])
        if @student and (@student.enrollments.where(course_id: @course.id) != nil or @student.enrollments.where(course_id: @course.id) != [])
          @enrollment = Enrollment.find_by(course_id: @course.id, user_id: @student.id)
          if @enrollment
            @enrollment.destroy
            redirect_to "/courses/edit/#{@course.id}"
          else
            redirect_to "/courses/edit/#{@course.id}"
          end
        else
          redirect_to "/courses/edit/#{@course.id}"
        end
      else
        redirect_to "/users/view/#{@teacher.id}"
      end
    else
      redirect_to "/users/view/#{@teacher.id}"
    end
  end
  
  #enable and generate join code
  def enable_join_code
    
  end
  
  #disable join code by setting to nil
  def disable_join_code
    
  end
end