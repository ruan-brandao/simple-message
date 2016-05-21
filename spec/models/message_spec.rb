require 'rails_helper'

RSpec.describe Message, type: :model do
  it { expect(subject).to belong_to(:user) }

  it { expect(subject).to validate_presence_of(:user) }
  it { expect(subject).to validate_presence_of(:text) }
end
