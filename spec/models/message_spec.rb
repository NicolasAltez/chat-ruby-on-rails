require 'rails_helper'

RSpec.describe Message, type: :model do

  let(:message) {create(:message)}

  it "is valid with content" do
    expect(message).to be_valid
  end

  it "is invalid without content" do
    message.content = nil
    expect(message).to be_invalid
  end

  it "calls broadcast_prepend_to after create" do
    message = Message.new(content: "mensaje")
    expect(message).to receive(:broadcast_prepend_to).with('messages')
    message.save
  end
  
end
