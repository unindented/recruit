class Admin < ActiveRecord::Base

  devise :database_authenticatable, :rememberable, :validatable

end
