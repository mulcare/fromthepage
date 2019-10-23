class Visit < ActiveRecord::Base
  has_many :ahoy_events, class_name: "Ahoy::Event"
  belongs_to :user, optional: true
  has_many :deeds
end
