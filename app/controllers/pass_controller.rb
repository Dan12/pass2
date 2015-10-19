class PassController < ApplicationController
  
  #create pass, if by teacher, it is automatically verified
  #if by student, student must request from class page and be in class
  def create
  
  end
  
  #detailed view of pass, only accessed by student with student_id
  #and all teachers
  def view
  
  end
  
  #quick overview of all passes organized by date and time
  #for when they are to be used
  #only viewable by teachers and admins
  def index
    
  end
  
  #teacher verifies pass with their teacher_id, makes pass valid
  def verify_pass
    
  end
  
  #teacher with teacher_id_to verifies that the student arrived and destroys the pass
  def destroy
    
  end
end