require "rails_helper"

describe SessionValidator do
  it "doesn validates an invalid session instance" do
    user = nil
    output = SessionValidator.validate(user)
    expect(output[:user_id]).to eq nil
    expect(output[:valid]).to be nil
  end

  it "validates a valid session instance" do
    user = User.create(username: "test", email: "w@me.com", password: "12312323", password_confirmation: "12312323")
    output = SessionValidator.validate(user)
    expect(output[:user_id]).to be > 0
    expect(output[:valid]).to be true
  end
end
