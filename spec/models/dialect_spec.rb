require 'rails_helper'

RSpec.describe Dialect, type: :model do
  it { should have_many(:users) }
end
