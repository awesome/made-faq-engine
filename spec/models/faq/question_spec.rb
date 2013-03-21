require 'spec_helper'

module Faq
  describe Question do
    before(:each) do
      @question = FactoryGirl.create(:faq_question)
    end

    it "creates a new faq question" do
      @question.instance_of?(Faq::Question)
    end

    it "can't create a new faq question without a subject" do
      new_question = FactoryGirl.build(:faq_question, :subject => nil)
      new_question.should have(1).error_on(:subject)
    end

    it "can't create a new faq question without an order" do
      new_question = FactoryGirl.build(:faq_question, :order => nil)
      new_question.should have(1).error_on(:order)
    end

    it "can't create a new faq question without an answer" do
      new_question = FactoryGirl.build(:faq_question, :answer => nil)
      new_question.should have(1).error_on(:answer)
    end

    it "returns questions in correct order" do
      category = category_with_questions(3)
      questions = Faq::Question.where("category_id = ?", category.id)
      first_question = questions.first
      last_question = questions.last
      questions.first.order = 3
      first_question.save
      last_question.order = 1
      last_question.save
      Faq::Question.where("category_id = ?", category.id).first.subject.should match(last_question.subject)
    end
  end
end
