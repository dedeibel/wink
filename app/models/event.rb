class Event < ActiveRecord::Base
  has_many :cases

  validates :name, uniqueness: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :location, presence: true
end
