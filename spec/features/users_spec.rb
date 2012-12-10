require 'spec_helper'

describe "Users" do
  describe "Check About" do
     it "Show about" do
        visit about_path
        page.should have_content 'About'
      end
  end
   
   describe "Check Welcome" do
      it "Show welcome" do
         visit welcome_path
         page.should have_content 'Welcome'
      end
   end
   
   describe "Check New User" do
      it "Show registration" do
         visit new_user_registration_path
         page.should have_content 'Email'
      end
   end
end
