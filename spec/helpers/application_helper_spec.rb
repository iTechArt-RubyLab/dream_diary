require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#phase_name' do
    it 'returns the name of the moon phase' do
      result = helper.phase_name({ days: [{ moonphase_name: 'First Quarter' }] })

      expect(result).to eq('first_quarter')
    end
  end
end
