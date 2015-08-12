class Measurement < ActiveRecord::Base
  #     include ActiveModel::Validations
  #     include ActiveModel::Validations::Callbacks

belongs_to :tree
  before_validation :set_code
  validates :tree_code, :girth, :height, presence: true

  private
  def set_code
    #code=self.id << :project_id.to_str
  end
end
