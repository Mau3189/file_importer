class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :campaign_name
      t.string :impressions
      t.integer :clicks
      t.integer :cost
      t.datetime :timestamp
      t.references :datafile, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
