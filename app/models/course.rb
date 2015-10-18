class Course < ActiveRecord::Base
  has_many :users
  
  has_many :users, through: :enrollments
end
