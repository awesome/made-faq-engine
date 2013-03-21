class CreateFaqQuestion < ActiveRecord::Migration
  def change
    create_table :faq_questions do |t|
      t.string      :subject
      t.string      :url
      t.text        :answer
      t.integer     :order, :default => 9999

      t.timestamps
    end
  end
end
