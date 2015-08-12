class CreateTrees < ActiveRecord::Migration
  def change
    create_table :trees do |t|
      t.string :code
      t.integer :number
      t.string :specie
      t.string :status
      t.string :comment
      t.references :forest, index: true

      t.timestamps null: false
    end
  end
end
