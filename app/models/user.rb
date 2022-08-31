class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, dependent: :destroy

  has_many :comments, dependent: :destroy

  has_many :subscriptions

  after_commit :link_subscriptions, on: :create

  before_validation :set_name, on: :create

  validates :name, presence: true, length: {maximum: 35}
  validates :email, presence: true, length: {maximum: 255}
  validates :email, uniqueness: true
  validates :email, format: /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/

  private

  def set_name
    self.name = "Comrade №#{rand(777)}" if self.name.blank?
  end

  def link_subscriptions
  Subscription.where(user_id: nil, user_email: self.email)
    .update_all(user_id: self.id)
  end
end
