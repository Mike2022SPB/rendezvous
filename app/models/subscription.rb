class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  with_options if: -> { user.present? } do
    validate :prohibition_of_self_signing
    validates :user, uniqueness: {scope: :event_id}
  end

  with_options unless: -> { user.present? } do
    validates :user_name, presence: true
    validates :user_email, presence: true, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/
    validate :prohibition_of_using_a_busy_email
    validates :user_email, uniqueness: {scope: :event_id}
  end

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
