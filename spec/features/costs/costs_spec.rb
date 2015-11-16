require "rails_helper"

describe "Costs", type: :feature do

  let!(:product){ create(:product, name: 'Cucumber') }
  let!(:balance1){ create(:balance) }

  # it "Should be work" do
  #   visit "/"
  #   click_link("Today costs")
  #   select("Cucumber", from: "Product")
  #   fill_in("Weight(kg/items)", with: "10")
  #   fill_in("Unit price", with: "15")
  #   click_button("Add")
  #   expect(page).to have_content("The operation was successful")
  #   expect(page).to have_content("150")
  #   click_link("All costs")
  #   expect(page).to have_content("150")
  # end
end
