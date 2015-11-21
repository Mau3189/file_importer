class Datafile < ActiveRecord::Base
  validates_uniqueness_of :filename
  validates_presence_of :filename

  has_many :records
end
