class PassController < ApplicationController
  
  #create pass, if by teacher, it is automatically verified
  #if by student, student must request from class page and be in class
  def create
    @creator = current_user
    #teacher
    if @creator.user_type == 2 or @creator.user_type == 3
      
    #student
    else
      
    end
  end
  
  #detailed view of pass, only accessed by student with student_id
  #and all teachers
  def view
    @pass = Pass.find_by(id: params[:id])
    render "view"
  end
  
  #quick overview of all passes organized by date and time
  #for when they are to be used
  #only viewable by teachers and admins
  def index
    @current_user = current_user
    if @current_user.user_type == 2 or @current_user.user_type == 3
      currentTime = DateTime.now
      @passes = Pass.find(:all, :conditions => {:pass_datetime => (currentTime.to_time-1.hours).to_datetime..(currentTime.to_time+1.hours).to_datetime})
      render "index"
    else
      redirect_to "/users/view/#{@current_user.id}"
    end
  end
  
  #teacher verifies pass with their teacher_id, makes pass valid
  def verify_pass
    
  end
  
  #teacher with teacher_id_to verifies that the student arrived and destroys the pass
  def destroy
    
  end
end