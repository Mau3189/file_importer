class Datafile < ActiveRecord::Base
  validates :filename, uniqueness: true, presence: true
  has_many :records, dependent: :destroy
end
