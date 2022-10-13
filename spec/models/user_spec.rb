require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with email and password"do
    user = FactoryBot.create(:user)
    expect(user).to be_valid
  end

  it "expect password be equal to..." do
    user = FactoryBot.create(:user)
    expect(user.password).to eq("123456")
  end

  it "expect to be valid password" do
    user = FactoryBot.create(:user)
    user.password = nil 
    expect(user).to_not be_valid
  end
end
