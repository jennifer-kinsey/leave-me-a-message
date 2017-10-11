class Message < ActiveRecord::Base
  belongs_to :user
  validates :body, :favorite, :presence => true
end
