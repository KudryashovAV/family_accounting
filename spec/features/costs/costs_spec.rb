require "rails_helper"

describe "Costs", type: :feature, js: true do

  let!(:product){ create(:product, name: 'Cucumber') }
  let!(:test_user){create(:user)}
  let!(:balance1){ create(:balance, amount: 200, user_id: test_user.id) }

  def create_purchase(product, weight, unit_price)
    find('#new_purchase').click
    select2(product, css: '.select2-container')
    fill_in("Weight(kg/items)", with: weight)
    fill_in("Unit price", with: unit_price)
    page.find(".glyphicon.glyphicon-plus").click()
  end

  it "Should be work" do
    login_as(test_user)
    visit "/"
    click_link("Costs")
    expect(page).to have_content("New cost")
    find(:xpath, "//*[@id='cost_date']").set(Date.today)
    first(:xpath, '//body').click
    find('.glyphicon.glyphicon-plus').click
    expect(page).to have_content("Add purchase")
    expect(page).to have_content("You're free money: 200,00")
    create_purchase(product.name, "10", "15")
    expect(page).to have_content("The operation was successful")
    expect(page).to have_content("You're free money: 50,00")
    create_purchase(product.name, "10", "15")
    expect(page).to have_content("For this action is not enough money")
    expect(page).to have_content("Reporting period")
  end
end
