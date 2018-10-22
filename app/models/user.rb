class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum user_type: {applicant: 1, employer: 2}

  has_many :jobs, foreign_key: 'employer_id'
  has_many :job_applications
end
