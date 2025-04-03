class Feedback < ApplicationRecord
  belongs_to :user, optional: true

  validates :content, :name, presence: true

  before_create :set_feedback_date

  private

  def set_feedback_date
    self.feedback_date = Date.today
  end
end
