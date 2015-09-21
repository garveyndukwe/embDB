class Project < ActiveRecord::Base

  has_many :forests, dependent: :delete_all
  validates :name, presence: true
end
