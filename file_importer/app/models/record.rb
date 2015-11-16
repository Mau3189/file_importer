require 'csv'

class Record < ActiveRecord::Base
  belongs_to :data_file
  validates_presence_of :data_file
  
  def self.import(data_file, file)
    puts '##########################'
    puts data_file.inspect
    puts '##########################'

    data_file_id = data_file.id

    CSV.foreach(file.path, headers: true) do |row|
      Record.create!(
        data_file_id: data_file_id,
        campaign_name: row['campaign_name'],
        impressions: row['impressions'],
        clicks: row['clicks'],
        cost: row['cost'],
        timestamp: row['timestamp']
      )
    end
  end

end
