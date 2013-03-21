class AddCategoryIdToQuestion < ActiveRecord::Migration
  def change
    add_column :faq_questions, :category_id, :integer
  end
end
