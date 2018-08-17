require 'rails_helper'

feature 'User sees own todos' do
  scenario 'does NOT see others todos'  do
    user_john = User.create!(email: 'john@mail.com')
    user_doe = User.create!(email: 'doe@mail.com')

    Todo.create!(title: 'Buy Cookie', user_id: user_john.id)
    Todo.create!(title: 'Buy Milk', user_id: user_doe.id)

    sign_in_as user_john.email

    expect(page).not_to have_css '.todos__item h4', text: 'Buy Milk'
  end

  scenario 'see own todos'  do
    user_john = User.create!(email: 'john@mail.com')
    user_doe = User.create!(email: 'doe@mail.com')

    Todo.create!(title: 'Buy Cookie', user_id: user_john.id)
    Todo.create!(title: 'Buy Milk', user_id: user_doe.id)

    sign_in_as user_john.email

    expect(page).to have_css '.todos__item h4', text: 'Buy Cookie'
  end
end