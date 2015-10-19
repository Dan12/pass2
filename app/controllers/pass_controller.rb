class PassController < ApplicationController
  
  #create pass, if by teacher, it is automatically verified
  #if by student, student must request from class page and be in class
  def create
  
  end
  
  #detailed view of pass
  def view
  
  end
  
  #teacher verifies pass with their teacher_id, makes pass valid
  def verify
    
  end
  
  #teacher with teacher_id_to verifies that the student arrived and destroys the pass
  def destroy
    
  end
end