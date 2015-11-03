class Widget < ActiveRecord::Base
  has_many :reviews

  validates :color, presence: true
end
