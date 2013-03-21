require 'spec_helper'

module Faq
  describe Category do
    before(:each) do
      @category = FactoryGirl.create(:faq_category)
    end

    it "creates a new faq category" do
      @category.instance_of?(Faq::Category)
    end

    it "can't create a new faq category without a title" do
      new_category = FactoryGirl.build(:faq_category, :title => nil)
      new_category.should have(1).error_on(:title)
    end

    it "can't create a new faq category without an order" do
      new_category = FactoryGirl.build(:faq_category, :order => nil)
      new_category.should have(1).error_on(:order)
    end

    it "can't create a new faq category without an image" do
      new_category = FactoryGirl.build(:faq_category, :image => nil)
      new_category.should have(1).error_on(:image)
    end

    it "create a faq category without any questions" do
      @category.questions.should be_empty
    end

    it "returns the category title as a string" do
      @category.title.instance_of?(String)
    end

    it "orders the categories correctly using default scope" do
      @category.order = 2
      @category.save
      new_category = FactoryGirl.build(:faq_category, :order => 1)
      Faq::Category.first.title.should match(new_category.title)
    end
  end
end
