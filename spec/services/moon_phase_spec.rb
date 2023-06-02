require 'rails_helper'

RSpec.describe MoonPhase do
  describe '.represent_phase' do
    it 'returns the moon phase name for a given phase value' do
      stub_const('Constants::MOON_PHASES',
                 { 0..0.03 => 'New Moon', 0.04..0.47 => 'Waxing Crescent', 0.48..0.52 => 'First Quarter',
                   0.53..0.97 => 'Waxing Gibbous', 0.98..1.0 => 'Full Moon' })

      expect(MoonPhase.represent_phase(0.01)).to eq('New Moon')
      expect(MoonPhase.represent_phase(0.25)).to eq('Waxing Crescent')
      expect(MoonPhase.represent_phase(0.5)).to eq('First Quarter')
      expect(MoonPhase.represent_phase(0.75)).to eq('Waxing Gibbous')
      expect(MoonPhase.represent_phase(0.99)).to eq('Full Moon')
      expect(MoonPhase.represent_phase(1.1)).to eq('Invalid moon phase')
    end
  end
end
