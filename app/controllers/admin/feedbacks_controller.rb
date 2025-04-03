module Admin
  class FeedbacksController < ApplicationController
    def index
      @feedbacks = Feedback.order(feedback_date: :desc)
    end
  end
end
