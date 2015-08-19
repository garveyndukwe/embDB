class Tree < ActiveRecord::Base

  belongs_to :forest
  has_many :measurements


#  validates_length_of  :code, minimum:2
  validates  :number, presence: true
  validates  :code, presence: true, uniqueness: true



end
