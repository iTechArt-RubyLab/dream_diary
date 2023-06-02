require 'rails_helper'

RSpec.describe Dream, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:date) }
    it { is_expected.to validate_presence_of(:duration) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_least(3).is_at_most(50) }
    it { is_expected.to validate_length_of(:description).is_at_most(2500) }
    it { is_expected.to allow_value(Time.zone.today).for(:date) }
    it { is_expected.to allow_value(Time.zone.tomorrow - 1.second).for(:date) }
    it { is_expected.to_not allow_value(Time.zone.today - 101.years).for(:date) }
    it { is_expected.to_not allow_value(Time.zone.tomorrow).for(:date) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:category).counter_cache(:dreams_count) }
    it { is_expected.to have_many(:comments).dependent(:destroy) }
    it { is_expected.to have_and_belong_to_many(:tags) }
    it { is_expected.to have_one_attached(:image) }
  end

  describe 'methods' do
    let(:dream) { create(:dream, tags: [create(:tag, name: 'tag1'), create(:tag, name: 'tag2')]) }

    describe '#search_data' do
      it 'returns the search data hash' do
        expect(dream.search_data).to eq({ title: dream.title, description: dream.description, date: dream.date,
                                          tags: %w[tag1 tag2] })
      end
    end
  end
end
