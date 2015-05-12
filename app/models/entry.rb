class Entry < ActiveRecord::Base
  belongs_to :patient
  validates_uniqueness_of :date
end
