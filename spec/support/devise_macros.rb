module DeviseMacros
  def login_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryGirl.create(:user, :valid_channel)
    sign_in user
  end

  def login_user_with_invalid_channel_and_filename
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryGirl.create(:user, :invalid_channel, username: 'darkwing duck', filename: 'darkwing_duck.pdf')
    sign_in user
  end
end