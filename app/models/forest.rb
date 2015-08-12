class Forest < ActiveRecord::Base
  belongs_to :project
  #belongs_to :user
  has_many :trees
  validates :description, presence: true, length: { minimum: 10 }

end
