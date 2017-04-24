require 'rails_helper'

RSpec.describe ChatRoom, type: :model do
  it { should have_many(:users).through(:messages) }
  it { should have_many(:messages).order(created_at: :asc) }
end
