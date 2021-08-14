require 'rails_helper'

RSpec.describe Message, type: :model do
  context 'with valid attributes' do
    it 'should save' do
      expect(build(:message, user: build(:user))).to be_valid
    end
  end
  context 'with bad attributes' do
    it 'should not save with message blank' do
      expect(build(:message, message:'')).to be_invalid
    end
    it 'should not save if it is less than 10 characters' do
      expect(build(:message, message:'hello')).to be_invalid
    end
    it 'should not save if there is no user reference' do
      expect(build(:message)).to be_invalid
    end
  end
end
