require 'spec_helper'
require 'ruby-debug'

describe PagesController do
  render_views

  describe "GET root" do
    it "redirects to login page if not logged in" do
      get 'index'

      response.should redirect_to(new_user_session_path)
    end

    it "shows index page if user is logged in" do
      login_user
      get 'index'

      response.should be_success
    end

    it "shows content for userchannel if available" do
      login_user
      get 'index'

      response.should render_template(:partial => "pages/snippets/_#{subject.current_user.channel}")
    end

    it "shows default content if content for userchannel is not available" do
      login_user_with_invalid_channel_and_filename
      get 'index'

      response.should_not render_template(:partial => subject.current_user.channel)
      response.should render_template(:partial => 'pages/snippets/_default')
    end
  end

  describe "GET download" do
    let(:send_file_params) {{
                              filename: "duck_norris.pdf",
                              type: 'application/pdf',
                              disposition: 'attachment'
                            }}

    it "redirects to login page if not logged in" do
      get 'download'

      response.should redirect_to(new_user_session_path)
    end

    it "sends file if file with name according to userchannel exists" do
      login_user

      controller.stub(:render)
      controller.should_receive(:send_file)
      get 'download'
    end

    it "should use the filename stored in the user if filename exists" do
      login_user

      controller.stub(:render)
      controller.should_receive(:send_file).with(kind_of(Pathname), send_file_params)

      get 'download'
    end

    it "prints an error if file with name according to user filename does not exist" do
      login_user_with_invalid_channel_and_filename
      get 'download'

      response.should redirect_to(:root)
      flash[:alert].should == "Datei wurde nicht gefunden"
    end
  end
end