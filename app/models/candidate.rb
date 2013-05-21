class Candidate < ActiveRecord::Base

  belongs_to :role

  validates :name, :email, presence: true
  validates :email, uniqueness: {case_sensitive: false}

end
