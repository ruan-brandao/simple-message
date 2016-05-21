require 'rails_helper'

RSpec.describe Message, type: :model do
  it { expect(subject).to belong_to(:user) }
end
