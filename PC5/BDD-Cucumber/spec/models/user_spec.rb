require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @valid_attributes = {
      name: "John Doe",
      email: "john.doe@example.com",
      password: "password123"
    }
  end

  it "is valid with valid attributes" do
    user = User.new(@valid_attributes)
    expect(user).to be_valid
  end
end
