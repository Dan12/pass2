class PassController < ApplicationController
  
  #create pass, if by teacher, it is automatically verified
  #if by student, student must request from class page and be in class
  def create
    @creator = current_user
    #teacher
    if @creator.user_type == 2 or @creator.user_type == 3
      @teacher_to = User.find_by(id: params[:teacher_to_id])
      @student_to = User.find_by(id: params[:student_id])
      if @teacher_to and (@teacher_to.user_type == 2 or @teacher_to.user_type == 3) and @student_to
        @pass = Pass.new
        @pass.teacher_id_to = @teacher_to.id
        @pass.teacher_id_from = @creator.id
        @pass.location_to = params[:location_to]
        @pass.location_from = params[:location_from]
        @pass.reason = params[:reason]
        @pass.student_id = @student_to.id
        @pass.verified = true
        if params[:one_time] and params[:one_time] == "on"
          @pass.one_time = true
        else
          @pass.one_time = false
        end
        @pass.pass_datetime = (DateTime.iso8601(params[:pass_datetime]))+(params[:time_offset].to_i.minutes)
        @pass.save
      end
      redirect_to "/passes/index"
    #student
    else
      
    end
  end
  
  def teacher_search
    @teachers = User.where("(name LIKE ? OR email LIKE ?) AND (user_type == 2 OR user_type == 3)", "%#{params[:partial_name]}%", "%#{params[:partial_name]}%")
    @teachers.each do |t|
      t.uid = nil
      t.provider = nil
      t.oauth_token = nil
      t.oauth_expires_at = nil
    end
    render :json => {"teachers" => @teachers}
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
      @passes = Pass.where(:pass_datetime => (currentTime.to_time-1.hours).to_datetime..(currentTime.to_time+1.hours).to_datetime)
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