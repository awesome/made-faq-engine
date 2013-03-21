require 'factory_girl'
FactoryGirl.find_definitions

def category_with_questions(num, order=1)
  questions = []
  num.times do |i|
    questions << FactoryGirl.create(:faq_question, :subject => "Issue #{i}",:order => (i+1))
  end
  FactoryGirl.create(:faq_category,
    questions: questions,
    order: order
  )
end
