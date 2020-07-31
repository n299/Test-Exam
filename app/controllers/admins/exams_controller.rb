# frozen_string_literal: true

module Admins
  class ExamsController < BaseController
    def new
      @exam = Exam.new
      question = @exam.questions.build
      question.answers.build
    end

    def create
      @exam = Exam.new exam_params
      if @exam.save
        redirect_to admins_exams_path
      else
        render :new
      end
    end

    private

    def exam_params
      params.require(:exam).permit(:status, :category_id, questions_attributes: [ :id, :content, :point, answers_attributes: [:id, :text, :correct]])
    end
  end
end
