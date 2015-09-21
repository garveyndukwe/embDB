module MeasurementsHelper
  #Auto-validate tree measurement int_arg number of trees
  def verify_measurement
    @tree.measurements.each do |measure|
      if measure.year_taken >= @measurement.year_taken
        flash[:alert]="Measurement Year is same or earlier one #{measure.year_taken}"
      end
      if measure.girth >= @measurement.girth
        flash[:alert]="Measurement Girth is less or equal to a previous one #{measure.year_taken}"
      end
      if measure.height >= @measurement.height
        flash[:alert]="Measurement Height is less or equal to a previous one #{measure.year_taken}"
      end
    end

  end

end
