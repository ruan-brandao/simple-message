require 'rails_helper'

describe ApplicationHelper, type: :helper do
  describe "#auth_link" do
    it "renders a 'logout' link with a user logged in" do
      allow(helper).to receive(:user_signed_in?).and_return(true)

      expect(helper).to receive(:link_to).with('Logout', destroy_user_session_path, :method => :delete)

      helper.auth_link
    end

    it "renders a 'sign in' link without a user logged in" do
      allow(helper).to receive(:user_signed_in?).and_return(false)

      expect(helper).to receive(:link_to).with('Login', new_user_session_path)

      helper.auth_link
    end
  end
end
