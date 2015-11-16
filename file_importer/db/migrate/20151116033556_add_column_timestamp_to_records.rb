class AddColumnTimestampToRecords < ActiveRecord::Migration
  def change
    add_column :records, :timestamp, :datetime
  end
end
