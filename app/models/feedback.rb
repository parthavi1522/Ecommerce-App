class Feedback < ApplicationRecord
  belongs_to :user

  validates :content, presence: true

  before_create :set_feedback_date

  private

  def set_feedback_date
    self.feedback_date = Date.today
  end
end
