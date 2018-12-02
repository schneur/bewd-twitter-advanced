require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe '.create' do
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
      user = FactoryBot.create(:user)
      tweet = FactoryBot.create(:tweet, user: user, message: 'ok', image: File.new("#{Rails.root}/spec/fixtures/files/test.png"))

      expect(tweet.image_content_type).to eq("image/png")
      expect(tweet.image_file_name).not_to be_nil
      expect(tweet.image_file_size).not_to be_nil
      expect(tweet.image_updated_at).not_to be_nil
    end
  end
end
