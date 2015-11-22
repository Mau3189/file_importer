class Record < ActiveRecord::Base
  belongs_to :datafile
  validates :datafile, presence: true
end
