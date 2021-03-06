class LunchRequest < ApplicationRecord
  # validates :datetime, :suggested_duration, :lunch_type, presence: true
  # validates :address, presence: true
  # validates :address,
  # exclusion: {
  #   in: ["Please put in your full address here."],
  #   message: "You can not save a request with the default address",
  #   allow_nil: false
  # }
  belongs_to :user
  has_one :lunch_date
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
  # validates :latitude, exclusion: { in: [0.0] }
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode


  TYPES = ["casual", "professional"]
  def deactivate
    self.active = false
    self.save
  end

  def self.generate_score_increase
    (1..5).to_a.sample
  end

  def scored?
    self.score_increase > 0
  end




end
