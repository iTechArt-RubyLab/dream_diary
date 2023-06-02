require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { create(:category) }

  it 'is valid with valid attributes' do
    expect(category).to be_valid
  end

  it 'is not valid without a name' do
    category.name = nil
    expect(category).to_not be_valid
  end

  it 'is not valid without a description' do
    category.description = nil
    expect(category).to_not be_valid
  end

  it 'is not valid with a non-unique name' do
    FactoryBot.create(:category, name: 'Test')
    category.name = 'Test'
    expect(category).to_not be_valid
  end

  it 'is valid with an active status' do
    category.status = 'active'
    expect(category).to be_valid
  end

  it 'is valid with an archived status' do
    category.status = 'archived'
    expect(category).to be_valid
  end

  it 'nullifies associated dreams when destroyed' do
    dream = FactoryBot.create(:dream, category:)
    category.destroy
    expect(dream.reload.category).to be_nil
  end
end
