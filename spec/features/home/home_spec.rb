require "rails_helper"

describe "Home page", type: :feature do

  let!(:balance1){create(:balance)}
  let!(:test_user){create(:user)}

  it "Should be work" do
    login_as(test_user)

    visit "/"
    expect(page).to have_content("Products")
    expect(page).to have_content("Incomes")
    expect(page).to have_content("Costs")
    expect(page).to have_content("Sign out")
    expect(page).to have_content("Incomes in this month")
  end
end
