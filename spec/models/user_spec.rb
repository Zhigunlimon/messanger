require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user) { create(:user, dialect: dialect) }
  let(:dialect) { create(:dialect) }

  it { should have_many(:chat_rooms) }
  it { should have_many(:messages) }
  it { should belong_to(:dialect) }
  it { should validate_presence_of(:dialect).with_message('must exist') }

  describe '#nickname' do
    it 'from email' do
      expect(user.nickname).to eq('test')
    end

    it 'from name' do
      user.update(name: 'developer')
      expect(user.nickname).to eq('developer')
    end
  end
end
