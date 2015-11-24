require "rails_helper"

describe "Products", type: :feature do

  let!(:balance1){create(:balance)}
  let!(:test_user){create(:user)}

  it "Should be work" do
    login_as(test_user)
    visit "/"
    click_link("Products")
    expect(page).to have_content("New product")
    fill_in("Name", with: "Cucumber")
    select("Food", from: "product[kind]")
    click_button("New product")
    expect(page).to have_content("The operation was successful")
    expect(page).to have_content("Food")
  end
end
