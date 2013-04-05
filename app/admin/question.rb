if defined?(ActiveAdmin) and Faq.config.engine_active_admin
  ActiveAdmin.register Faq::Question do
    controller do
      cache_sweeper Faq.config.question_cache_sweeper if Faq.config.question_cache_sweeper
      defaults      :finder => :find_by_url
    end

    menu :label => "Questions", :parent => "FAQs", :priority => 1

    index do
      column :subject
      column :created_at
      column :updated_at

      default_actions
    end

    form do |f|
      f.inputs "Question" do
        f.input     :subject

        f.input     :answer

        f.input     :category

        f.input     :order,
                    :hint => "The display order within the category"
      end

      f.actions
    end
  end
end
