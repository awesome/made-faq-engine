class AddIndexesToFaqQuestion < ActiveRecord::Migration
  def change
    add_index :faq_questions, :category_id
    add_index :faq_questions, :url
    add_index :faq_questions, :order
  end
end
