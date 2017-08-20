def add_recipient
  visit('/')
  click_button "Make a payment"
  fill_in :recipient, with: "Guybrush Threepwood"
  click_button "Add Recipient"
end
