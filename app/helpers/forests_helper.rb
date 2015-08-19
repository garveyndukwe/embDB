module ForestsHelper

  #Auto-generate int_arg number of trees
  def generate_trees (int_arg)
    int_arg.times {
      t_number = increment(@forest.trees.count)
      t_code = concatenate(@project.id,@forest.id)
      t_code = concatenate(t_code,t_number)
        if @forest.plantation?
          t_specie = @forest.specie
        else
          t_specie = 1
        end

      @forest.trees.create(:code => t_code, :number => t_number, :specie=> t_specie, :status => "N/A", :comment => "N/A")
      }

  end

end
