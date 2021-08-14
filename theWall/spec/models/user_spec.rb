require 'rails_helper'

RSpec.describe User, type: :model do
  context 'with valid attributes' do
    it 'should save' do
      expect(build(:user)).to be_valid
    end
    it 'should save if it is a unique username' do
      expect(build(:user, username:'billybobbie')).to be_valid
    end
    it 'should save if it is less than 5 characters' do
      expect(build(:user, username:'hello')).to be_valid
    end
  end
  
  context 'with bad attributes' do
    it 'should not save with username blank' do
      expect(build(:user, username:'')).to be_invalid
    end
    it 'should not save if is less than 5 characters' do
      expect(build(:user, username:'hey')).to be_invalid
    end
  end
end
