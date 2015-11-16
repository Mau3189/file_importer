class CreateDataFiles < ActiveRecord::Migration
  def change
    create_table :data_files do |t|
      t.string :filename

      t.timestamps null: false
    end
  end
end
