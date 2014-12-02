require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) {FactoryGirl.create(:user)}

  context "Factory settings for users" do
    it "should validate the users factories" do
      expect(FactoryGirl.create(:user).valid?).to be true
    end
  end

  describe User do
    it { should validate_presence_of :user_name }
    it { should allow_value('RaviShankar').for(:user_name)}

    it { should validate_presence_of :first_name }
    it { should allow_value('Ravi').for(:first_name)}

    it { should validate_presence_of :last_name }
    it { should allow_value('Shankar').for(:last_name)}

    it { should validate_presence_of :password }
    it { should allow_value('Password_123@').for(:password)}

    it { should validate_presence_of :password_confirmation }
    it { should allow_value('Password_123@').for(:password_confirmation)}

    it { should validate_presence_of :email }
    it { should validate_uniqueness_of(:email).with_message(/Email already exists/)}
    it { should allow_value('ABCDE@domain.com').for(:email)}

    it { should validate_presence_of :address }

    it { should validate_presence_of :phone }
    it { should allow_value('990-191-6142').for(:phone)}

  end


  it "should validate first_name lenght" do

    user.first_name = "sgdsdgshfdjhfdjgfhjfjfsfasfsgfdhgfdhfgafsafdsagagasgfasgagashg"
    user.valid?
    expect(user.errors[:first_name].size).to be 1
    expect(user).to be_invalid

    user.first_name = "s"
    user.valid?
    expect(user.errors[:first_name].size).to be 1
    expect(user).to be_invalid

    user.first_name = "Ravi"
    user.valid?
    expect(user.errors[:first_name].size).to be 0
    expect(user).to be_valid
  end

  it "should validate last_name lenght" do

      user.last_name = "sgdsdgshfdjhfdjgfhjfjfsfasfsgfdhgfdhfgafsafdsagagasgfasgagashg"
      user.valid?
      expect(user.errors[:last_name].size).to be 1
      expect(user).to be_invalid

      user.last_name = "s"
      user.valid?
      expect(user.errors[:last_name].size).to be 1
      expect(user).to be_invalid

      user.last_name = "Shankar"
      user.valid?
      expect(user.errors[:last_name].size).to be 0
      expect(user).to be_valid
    end

     it "should validate password lenght" do

      user.password = "sgdsdgshfdjhfdjgfhjfjfsfasfsgfdhgfdhfgafsafdsagagasgfasgagashg"
      user.valid?
      expect(user.errors[:password].size).to be 2
      expect(user).to be_invalid

      user.password = "sgd"
      user.valid?
      expect(user.errors[:password].size).to be 2
      expect(user).to be_invalid

      user.password = "Password_123@"
      user.valid?
      expect(user.errors[:password].size).to be 0
      expect(user).to be_valid
    end

    it "should validate phone lenght" do

      user.phone = "sgdsdgshfdjhfdjgfhjfjfsfasfsgfdhgfdhfgafsafdsagagasgfasgagashg"
      user.valid?
      expect(user.errors[:phone].size).to be 2
      expect(user).to be_invalid

      user.phone = "sgd"
      user.valid?
      expect(user.errors[:phone].size).to be 2
      expect(user).to be_invalid

      user.phone = "990-191-6142"
      user.valid?
      expect(user.errors[:phone].size).to be 0
      expect(user).to be_valid
    end

end
