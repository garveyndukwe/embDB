class Tree < ActiveRecord::Base

  belongs_to :forest
  has_many :measurements


#  validates_length_of  :code, minimum:2
  #before_validation :set_code
  validates  :code, :number, presence: true, uniqueness: true



end
