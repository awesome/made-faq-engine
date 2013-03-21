module Faq
  class FaqController < Faq::ApplicationController
    layout 'application'

    def index
      @faq_categories = Category.with_questions
    end
  end
end
