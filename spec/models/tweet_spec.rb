require 'rails_helper'

RSpec.describe Tweet, type: :model do
  context '.create' do
    it 'must belong to a user' do
      expect {
        Tweet.create!(message: 'test')
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'must have the presence of message' do
      expect {
        FactoryBot.create(:tweet, message: nil)
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'must have a message with max. 140 characters' do
      expect {
        FactoryBot.create(:tweet, message: 'c' * 141)
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'can have an image' do
      extend ActionDispatch::TestProcess

      user = FactoryBot.create(:user)
      tweet = FactoryBot.create(:tweet, user: user, message: 'ok', image: fixture_file_upload('test.png'))

      expect(tweet.reload.image.attached?).to eq(true)
    end
  end
end
