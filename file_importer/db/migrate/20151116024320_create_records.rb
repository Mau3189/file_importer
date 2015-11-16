class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :campaign_name
      t.string :impressions
      t.integer :clicks
      t.integer :cost

      t.timestamps null: false
    end
  end
end
