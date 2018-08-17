require 'rails_helper'

feature 'User creates todo' do
  scenario 'successfully' do
    sign_in
    visit root_path

    click_on 'Add todo'
    fill_in 'Title', with: 'Buy milk'
    click_on 'Submit'

    expect(page).to have_css '.todos__item h4', text: 'Buy milk'
  end
end