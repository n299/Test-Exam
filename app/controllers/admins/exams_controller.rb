# frozen_string_literal: true

module Admins
  class ExamsController < BaseController
    before_action :set_exam, only: %i[edit update destroy]
    before_action :current_exam, only: :show

    def index
      @exams = Exam.all.decorate
    end

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

    def show
      @questions = @exam.questions
    end

    def edit; end

    def update
      if @exam.update_attributes(exam_params)
        redirect_to admins_exams_path
      else
        render :edit
      end
    end

    def destroy
      redirect_to admins_exams_path if @exam.destroy
    end

    private

    def exam_params
      params.require(:exam).permit( :content, :status, :category_id,
                      questions_attributes: [ :id, :content, :point, :_destroy,
                      answers_attributes: [:id, :text, :correct, :_destroy]])
    end

    def set_exam
      @exam = Exam.find_by(id: params[:id])
      return redirect_to(admins_exams_url, alert: "Can't edit this exam!") if @exam.blank? || @exam.status_public?
    end

    def current_exam
      @exam = Exam.find_by(id: params[:id])
      return redirect_to(admins_exams_url, alert: 'Exam is not found!') if @exam.blank?
    end
  end
end
