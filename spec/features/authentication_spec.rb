feature 'User Authentication' do
  scenario 'Navigates to transactions payment is successful' do
    visit '/'
    click_button "Pay"
    expect(page).to have_content 'Hello Aaron'
  end
end