require "rails_helper"

describe "Incomes", type: :feature, js: true do

  let!(:test_user){create(:user)}
  let!(:balance){ create(:balance, amount: 0, user_id: test_user.id) }

  it "Should be work" do
    login_as(test_user)
    visit "/"
    click_link("Incomes")
    expect(page).to have_content("Reporting period")
    expect(page).to have_content("You're free money: 0,00")
    expect(page).to have_content("Incomes in this month: 0")
    fill_in("Price", with: 100)
    find(:xpath, "//*[@id='income_reporting_period']").set(Date.today)
    first(:xpath, '//body').click
    click_button 'Add'
    expect(page).to have_content("The operation was successful")
    expect(page).to have_content("You're free money: 100,00")
  end
end
