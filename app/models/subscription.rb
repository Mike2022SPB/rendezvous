class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :event, presence: true

  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/, unless: -> { user.present? }

  validate :prohibition_of_self_signing, if: -> { user.present? }

  validate :prohibition_of_using_a_busy_email, unless: -> { user.present? }

  validates :user, uniqueness: {scope: :event_id}, if: -> { user.present? }
  validates :user_email, uniqueness: {scope: :event_id}, unless: -> { user.present? }

  def user_name
    if user.present?
     user.name
    else
     super
    end
  end

  def user_email
    if user.present?
      user.email
    else
      super
    end
  end

  private

  def prohibition_of_self_signing
    errors.add(:user_email, :prohibited_of_self_signing) if event.user == user
  end

  def prohibition_of_using_a_busy_email
    errors.add(:user_email, :prohibited_email) if User.exists?(email: user_email)
  end
end
