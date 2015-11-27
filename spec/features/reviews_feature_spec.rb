require 'rails_helper'

feature 'reviewing' do
  before do
    Restaurant.create name: 'KFC'
    User.create(email: 'norm@example.com', password: '12345678')
    User.create(email: 'fred@example.com', password: '12345678')
  end

  scenario 'allows users to leave a review using a form' do
    login_user('norm@example.com', '12345678')
    leave_review('so so', '2')
    expect(current_path).to eq '/restaurants'
    expect(page).to have_content('so so')
  end
  def leave_review(thoughts, rating)
    visit '/restaurants'
    click_link 'Review KFC'
    fill_in 'Thoughts', with: thoughts
    select rating, from: 'Rating'
    click_button 'Leave Review'
  end

  def login_user(user, password)
    visit '/users/sign_in'
    fill_in 'Email', with: user
    fill_in 'Password', with: password
    click_button 'Log in'
  end

  scenario 'displays an average rating for all reviews' do
    login_user('norm@example.com', '12345678')
    leave_review('So so', '3')
    click_link 'Sign out'
    login_user('fred@example.com', '12345678')
    leave_review('Great', '5')
    expect(page).to have_content('Average rating: ★★★★☆')
  end
end
