require "rails_helper"

describe "Products", type: :feature do

  let!(:balance1){create(:balance)}

  it "Should be work" do
    visit "/"
    click_link("New product")
    expect(page).to have_content("We have")
    fill_in("Name", with: "Cucumber")
    click_button("Create Product")
    expect(page).to have_content("The operation was successful")
  end
end
