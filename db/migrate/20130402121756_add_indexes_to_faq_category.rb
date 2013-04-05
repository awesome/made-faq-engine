class AddIndexesToFaqCategory < ActiveRecord::Migration
  def change
    add_index :faq_categories, :url
    add_index :faq_categories, :order
  end
end
