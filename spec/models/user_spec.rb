require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of :username}
  it { is_expected.to validate_presence_of :email}
  it { is_expected.to validate_presence_of :password_hash}
  it { is_expected.to validate_presence_of :password_salt}

  it {is_expected.to validate_confirmation_of :password}
  it {is_expected.to validate_length_of(:password)
                               .is_at_least(6)
                               .is_at_most(20)}

  it { is_expected.to validate_uniqueness_of :email}
end
