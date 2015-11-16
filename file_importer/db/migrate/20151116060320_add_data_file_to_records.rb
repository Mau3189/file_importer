class AddDataFileToRecords < ActiveRecord::Migration
  def change
    add_reference :records, :data_file, index: true, foreign_key: true
  end
end
