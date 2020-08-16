# frozen_string_literal: true

class Exam < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions, reject_if: :reject_questions, allow_destroy: true
  has_many :user_exams
  # Validate
  validates :content, presence: true

  enum status: %i[draft public], _prefix: true
  scope :check_exam, ->(user) {
    status_public.includes(:user_exams).where( user_exams: {completed: true, user_id: user.id}).ids }
  scope :list_exam, ->(exam_id) { status_public.where.not(id: exam_id) }
  # # Exam.status_public.includes(:user_exams).where(user_exams: {completed: true, user_id: 1}).select("exams.*, user_exams.id AS idss")

  # def self.check_exam(user)
  #   Exam.status_public.decorate.select do |exam|
  #     UserExam.where(user: user, exam: exam, completed: true).blank?
  #   end
  # end

  private

  def reject_questions(attributes)
    attributes['content'].blank? || attributes['point'].blank?
  end
end
