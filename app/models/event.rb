class Event < ApplicationRecord
  validates :title, presence: true, length: {maximum: 255}
  validates :address, presence: true
  validates :datetime, presence: true
  validates :user, presence: true

  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :subscribers, through: :subscriptions, source: :user
  has_many :images, dependent: :destroy


  def pincode_valid?(pin2check)
    pincode == pin2check
  end
end
