require 'rails_helper'

RSpec.describe Message, type: :model do
  it "is valid with content" do
    message = Message.new(content: "Hello!")
    expect(message).to be_valid
  end

  it "is invalid without content" do
    message = Message.new(content: nil)
    expect(message).to be_invalid
  end
end
