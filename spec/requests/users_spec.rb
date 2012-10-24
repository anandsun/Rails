require 'spec_helper'

describe "Users" do

  describe "GET /users" do

    before do
      visit users_path
      click_link "New User"
    end

    it "require password" do
      fill_in "Name", with: "foo"
      fill_in "Email", with: "bar@gmail.com"
      click_button "Create User"
      
      error_message = "Password can't be blank"
      page.should have_content(error_message)
    end

    it "require name" do
      fill_in "Email", with: "bar@gmail.com"
      fill_in "Password", with: "b@Zdrum"
      click_button "Create User"
      
      error_message = "Name can't be blank"
      page.should have_content(error_message)
    end

     it "require email" do
      fill_in "Name", with: "foo"
      fill_in "Password", with: "b@Zdrum"
      click_button "Create User"
      
      error_message = "Email can't be blank"
      page.should have_content(error_message)
    end

  end

end
