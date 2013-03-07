module DeviseMacros
  def login_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryGirl.create(:user, :valid_channel)
    sign_in user
  end

  def login_user_with_invalid_channel
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryGirl.create(:user, :invalid_channel, username: 'darkwing duck')
    sign_in user
  end
end