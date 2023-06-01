module ApplicationHelper
  include Pagy::Frontend

  def moon_phase_image_tag(phase)
    image_tag("#{phase_name(phase)}.png")
  end

  def phase_name(phase)
    phase[:days].first[:moonphase_name].downcase.gsub(' ', '_')
  end
end
