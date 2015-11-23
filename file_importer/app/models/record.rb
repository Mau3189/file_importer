require 'csv'

class Record < ActiveRecord::Base
  belongs_to :datafile
  validates :datafile, presence: true

  def self.import(datafile, file)
    FileManager.new(file).unzip_csv(datafile.filename)
    csv_file_path = File.join('/tmp', "#{datafile.filename}.csv")

    CSV.foreach(csv_file_path, headers: true) do |row|
      Record.create! datafile_id: datafile.id,
                     campaign_name: row['campaign_name'],
                     impressions: row['impressions'],
                     clicks: row['clicks'],
                     cost: row['cost'],
                     timestamp: row['timestamp']
    end
  end
end
