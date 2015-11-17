require "rails_helper"

describe "Costs", type: :feature, js: true do

  let!(:product){ create(:product, name: 'Cucumber') }
  let!(:cost){ create(:cost, created_at: Date.today) }
  let!(:balance1){ create(:balance, amount: 200) }

  it "Should be work" do
    visit "/"
    click_link("Costs")
    find('.cost-card').click
    select2("Cucumber", css: '.select2-container')
    fill_in("Weight(kg/items)", with: "10")
    fill_in("Unit price", with: "15")
    page.find(".glyphicon.glyphicon-plus").click()
    expect(page).to have_content("The operation was successful")
    expect(page).to have_content("150")
  end
end
