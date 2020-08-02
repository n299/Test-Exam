# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_exams
  # Attached avatar
  has_one_attached :avatar
  # Validate
  validates :username, presence: true, length: { maximum: 20 }, format: { with: /\A[a-zA-Z0-9]+\z/ },
            uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :phone, format: { with: /\d[0-9]\)*\z/ }, length: { minimum: 10, maximum: 15 }, allow_nil: true
  # Search service
  scope :search_by_name, lambda { |name_search|
                            where('username LIKE :search
                                  OR last_name LIKE :search
                                  OR first_name LIKE :search', search: "%#{name_search}%")
                          }
end
