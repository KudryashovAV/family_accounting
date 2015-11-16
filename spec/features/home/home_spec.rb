require "rails_helper"

describe "Home page", type: :feature do

  let!(:balance1){create(:balance)}

  it "Should be work" do
    visit "/"
    expect(page).to have_content("Home")
    expect(page).to have_content("New product")
    expect(page).to have_content("Incomes")
    expect(page).to have_content("Costs")
    expect(page).to have_content("Report")

    click_link("New product")
    expect(page).to have_content("We have")
    click_link("Home")
    click_link("Incomes")
    expect(page).to have_content("Price")
    click_link("Home")
    click_link("Costs")
    expect(page).to have_content("Incomes in this month")
    click_link("Home")
    click_link("Report")
    expect(page).to have_content("From")
  end
end
