class Measurement < ActiveRecord::Base
  #     include ActiveModel::Validations
  #     include ActiveModel::Validations::Callbacks
        include ApplicationHelper

belongs_to :tree
  before_validation :set_code
  before_save :verify
  validates :tree_code, :year_taken, :girth, :height, presence: true

  private
  def verify
    #validate_measurement
  end
#Auto-validate tree measurement int_arg number of trees
def validate_measurement
  measures = Measurement.all
  measures.each do |measure|
    if measure.year_taken >= year_taken
      Messageflash('alert',"Measurement Year is same or earlier one #{measure.taken_at.year}")
    end
    if measure.girth >= @measurement.girth
      flash[:alert]="Measurement Girth is less or equal to a previous one #{measure.taken_at.year}"
    end
    if measure.height >= @measurement.height
      flash[:alert]="Measurement Height is less or equal to a previous one"
    end
  end

end

  def set_code
    #code=self.id << :project_id.to_str
  end
end
