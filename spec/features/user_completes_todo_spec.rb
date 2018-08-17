require 'rails_helper'

feature 'User completes todo' do
  scenario 'successfully' do
    user_john = User.create!(email: 'john@mail.com')
    Todo.create!(title: 'Buy Milk', user_id: user_john.id)

    sign_in_as user_john.email

    click_on 'Mark complete'

    expect(page).to have_css '.todos__item--completed h4', text: 'Buy Milk'
  end
end