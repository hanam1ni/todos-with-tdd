module Features
  def sign_in
    sign_in_as 'user@mail.com'
  end

  def sign_in_as(email)
    visit new_session_path

    fill_in 'Email', with: email
    click_on 'Sign in'
  end
end