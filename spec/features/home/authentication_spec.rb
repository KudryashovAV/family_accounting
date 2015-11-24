require 'rails_helper'

describe User do
  let!(:user){ create(:user, email: 'test@example.com', password: '123123') }

  it 'should sign up via Google' do
    visit '/'
    click_link ('Google_oauth2')
    expect(page).to have_content("Costs")
    expect(page).to have_content("Sign out")
  end

end
