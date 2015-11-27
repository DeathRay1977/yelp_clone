def sign_up
  visit '/users/sign_up'
  fill_in 'Email', with: 'norm@example.com'
  fill_in 'Password', with: '12345678'
  click 'Submit'
end
