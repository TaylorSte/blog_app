require "rails_helper"

RSpec.feature "Creating Articles" do
  scenario "A user creates a new article" do
    visit "/" #goto root      #capy
    click_link "New Article"    #capy
    fill_in "Title", with:"Creating first article"  #capy
    fill_in "Body", with: "Lrem Ipssum"   #capy
    click_button "Create Article" #capy

    expect(page).to have_content("Article has been created")  #rspec
    expect(page.current_path).to eq(articles_path)            #rspec

  end

  scenario "A user fails to create a new article" do

    visit "/" #goto root      #capy
    click_link "New Article"    #capy
    fill_in "Title", with:""  #capy
    fill_in "Body", with: ""   #capy

    click_button "Create Article" #capy

    expect(page).to have_content("Article has not been created")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")



    end
end