require 'spec_helper'


describe "TestLogins" do
   describe "as an admin" do
      it "should see file upload" do
         user = User.create(:password => 'password', :password_confirmation => 'password', :email => 'sample@sample.com')
         user.save!
         visit '/'
         click_link_or_button("Sign In")
         fill_in 'Email', :with => user.email
         fill_in 'Password', :with => user.password
         click_link_or_button("Sign in")
         page.should have_content "Signed in successfully."
         click_link_or_button("Files")
         page.should have_content 'New File'
      end
   end
   describe "as an admin" do
      it "should see student listing" do
         user = User.create(:password => "password", :password_confirmation => 'password', :email => 'sample@sample.com')
         user.save!
         visit '/'
         click_link_or_button("Sign In")
         fill_in 'Email', :with => user.email
         fill_in 'Password', :with => user.password
         click_link_or_button("Sign in")
         page.should have_content "Signed in successfully."
         click_link_or_button("Students")
         page.should have_content 'Listing students'
      end
   end
   describe "as an admin" do
      it "should see All Users" do
         user = User.create(:password => 'password', :password_confirmation => 'password', :email => 'sample@sample.com', :admin => true)
         user.save!
         visit '/'
         click_link_or_button("Sign In")
         fill_in 'Email', :with => user.email
         fill_in 'Password', :with => user.password
         click_link_or_button("Sign in")
         page.should have_content "Signed in successfully."
         #         click_link_or_button("Users")
         visit users_path
         page.should have_content 'All Users'
      end
   end

end
