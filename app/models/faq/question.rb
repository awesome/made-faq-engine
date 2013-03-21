require 'stringex'

module Faq
  class Question < ActiveRecord::Base
    self.table_name = "faq_questions"

    belongs_to                      :category

    attr_accessible                 :subject,
                                    :url,
                                    :answer,
                                    :order,
                                    :category_id

    validates_presence_of           :subject,
                                    :answer,
                                    :order

    validates_uniqueness_of         :subject

    acts_as_url                     :subject

    default_scope                   :order => '`order` ASC'

    def to_param
      url
    end

    def to_s
      subject
    end
  end
end
