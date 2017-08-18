feature 'User Authentication' do
  scenario 'Navigates to transactions payment is successful' do
    visit '/'
    click_button "Pay"
    expect(current_path).to eq '/transactions'
  end
end