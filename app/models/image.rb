class Image < ApplicationRecord
  belongs_to :event
  belongs_to :user

  has_one_attached :image do |attacheble|
    attacheble.variant :thumb, resize_to_limit: [300, 300]
  end
end
