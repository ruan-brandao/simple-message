require 'rails_helper'

describe MessagesHelper, type: :helper do
  let(:user) { FactoryGirl.create(:user) }
  let(:other_user) { FactoryGirl.create(:user) }
  let(:message) { FactoryGirl.create(:message, user: user) }

  describe "#message_delete_link" do
    it "returns a delete link when the current user owns the message" do
      allow(helper).to receive(:current_user).and_return(user)

      expect(helper).to receive(:link_to).with("Delete Message", message, method: :delete, data: { confirm: 'Are you sure?' })

      helper.message_delete_link(message)
    end

    it "returns nothing when the current user doesn't own the message" do
      allow(helper).to receive(:current_user).and_return(other_user)

      expect(helper).not_to receive(:link_to).with("Delete Message", message, method: :delete, data: { confirm: 'Are you sure?' })

      helper.message_delete_link(message)
    end
  end
end
