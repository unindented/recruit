class Role < ActiveRecord::Base

  has_many :candidates

  validates :name, presence: true
  validates :name, uniqueness: {case_sensitive: false}

  scope :enabled,  where(enabled: true)
  scope :disabled, where(enabled: false)

end
