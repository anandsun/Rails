require 'spec_helper'

describe "Users" do
  
  describe "GET users/sign_up" do

    before do
      visit new_user_registration_path
      
    end

    it "require password" do
      fill_in "user_name", with: "foo"
      fill_in "user_email", with: "bar@gmail.com"
      click_button "Sign up"
      
      error_message = "Password can't be blank"
      page.should have_content(error_message)
    end

    it "require name" do
      fill_in "user_email", with: "bar@gmail.com"
      fill_in "user_password", with: "b@Zdrum"
      click_button "Sign up"
      
      error_message = "Name can't be blank"
      page.should have_content(error_message)
    end

    it "require email" do
      fill_in "user_name", with: "foo"
      fill_in "user_password", with: "b@Zdrum"
      click_button "Sign up"
      
      error_message = "Email can't be blank"
      page.should have_content(error_message)
    end

    it "require valid email" do
      fill_in "user_name", with: "foo"
      fill_in "user_email", with: "bar"
      fill_in "user_password", with: "b@Zdrum"
      
      click_button "Sign up"
      
      error_message = "Email address must contain '@'"
      page.should have_content(error_message)
    end

    it "require password confirmation" do
      fill_in "user_name", with: "foo"
      fill_in "user_email", with: "bar"
      fill_in "user_password", with: "b@Zdrum"
      
      click_button "Sign up"
      
      error_message = "Password doesn't match confirmation"
      page.should have_content(error_message)
    end

    it "require matching password confirmation" do
      fill_in "user_name", with: "foo"
      fill_in "user_email", with: "bar"
      fill_in "user_password", with: "b@Zdrum"
      fill_in "user_password_confirmation", with: "b@Zdryn"
      
      click_button "Sign up"
      
      error_message = "Password doesn't match confirmation"
      page.should have_content(error_message)
    end


  end

end
