require 'stringex'

module Faq
  class Category < ActiveRecord::Base
    self.table_name = "faq_categories"

    has_many                        :questions
    accepts_nested_attributes_for   :questions, :allow_destroy => true

    attr_accessible                 :title,
                                    :url,
                                    :image,
                                    :order

    has_attached_file               :image,
                                    :styles => {
                                      :main => Faq.config.main_image_size,
                                      :thumb => Faq.config.thumb_image_size
                                    }

    validates_presence_of           :title,
                                    :order

    validates_uniqueness_of         :title

    validates_attachment_presence   :image

    acts_as_url                     :title

    default_scope                   :order => '`order` ASC'

    scope                           :with_questions,
                                    :conditions => 'id in (select distinct category_id from faq_questions)'

    def to_param
      url
    end

    def to_s
      title
    end
  end
end
