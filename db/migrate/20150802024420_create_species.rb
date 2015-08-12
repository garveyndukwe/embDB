class CreateSpecies < ActiveRecord::Migration
  def change
    create_table :species do |t|
      t.string :code
      t.string :botanical_name
      t.string :common_name
      t.timestamps null: false
      #t.references :forest, index: true
    end
    #add_attachment :species, :image
  end
end
