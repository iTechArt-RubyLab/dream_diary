# frozen_string_literal: true

module Constants
  MINSK_COORDINATES = '53.893009,27.567444'
  MOON_PHASES = {
    0 => 'New moon',
    0.01..0.24 => 'Waxing crescent',
    0.25 => 'First quarter',
    0.26..0.49 => 'Waxing gibbous',
    0.5 => 'Full moon',
    0.51..0.74 => 'Waning gibbous',
    0.75 => 'Last quarter',
    0.76..1 => 'Waning crescent'
  }.freeze
  MOON_API_URL = 'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline'
end
