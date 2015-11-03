class Review < ActiveRecord::Base
  belongs_to :widget

  validates_presence_of :stars, :message
end
