feature 'Adds a new recipient' do
  scenario 'User creates a new recipient after authentication' do
    visit('/')
    click_button 'Pay'
    fill_in :recipient, with: "Peter Parker"
    click_button "Add Recipient"
    expect(current_path).to eq '/transactions'
    expect(page).to have_content 'Hello Aaron'
  end
end
