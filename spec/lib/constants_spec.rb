require 'rails_helper'

RSpec.describe Constants do
  describe 'MINSK_COORDINATES' do
    it 'returns the correct coordinates' do
      expect(Constants::MINSK_COORDINATES).to eq('53.893009,27.567444')
    end
  end

  describe 'MOON_PHASES' do
    it 'returns the correct moon phases' do
      expect(Constants::MOON_PHASES).to eq({
                                             0 => 'New moon',
                                             0.01..0.24 => 'Waxing crescent',
                                             0.25 => 'First quarter',
                                             0.26..0.49 => 'Waxing gibbous',
                                             0.5 => 'Full moon',
                                             0.51..0.74 => 'Waning gibbous',
                                             0.75 => 'Last quarter',
                                             0.76..1 => 'Waning crescent'
                                           })
    end
  end

  describe 'MOON_API_URL' do
    it 'returns the correct URL' do
      expect(Constants::MOON_API_URL).to eq('https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline')
    end
  end
end
