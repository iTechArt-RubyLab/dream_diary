module ApplicationHelper
  def moon_phase_image_tag(phase)
    phase_name = phase[:days].first[:moonphase_name].downcase.gsub(' ', '_')
    image_tag("#{phase_name}.png")
  end
end
