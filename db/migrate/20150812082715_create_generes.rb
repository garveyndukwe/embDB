class CreateGeneres < ActiveRecord::Migration
  def change
    create_table :generes do |t|
      t.string :code
      t.string :botanical_name
      t.string :common_name

      t.timestamps null: false
    end
  end
end
