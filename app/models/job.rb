class Job < ApplicationRecord

  #Associations
  has_many :job_applications

  has_many :applicants, through: :job_applications, source: :user

  belongs_to :employer, class_name: "User", foreign_key: 'employer_id'

  scope :by_employer, -> employer_id { where(employer_id: employer_id) }

end
