module Features
  def sign_in
    visit new_session_path

    fill_in 'Email', with: 'user@email.com'
    click_on 'Sign in'
  end
end