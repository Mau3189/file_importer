class Record < ActiveRecord::Base
  belongs_to :datafile

  validates_presence_of :datafile
end
