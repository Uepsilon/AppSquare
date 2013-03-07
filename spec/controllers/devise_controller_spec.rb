require 'spec_helper'

describe DeviseController do
  include Devise::TestHelpers

  describe "GET page from pages controller" do
    it "has current_user if logged in" do
      login_user

      subject.current_user.should_not be_nil
    end

    it "has no current_user if not logged in" do
      subject.current_user.should be_nil
    end
  end
end