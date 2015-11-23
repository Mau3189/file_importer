class CreateDatafiles < ActiveRecord::Migration
  def change
    create_table :datafiles do |t|
      t.string :filename

      t.timestamps null: false
    end
  end
end
