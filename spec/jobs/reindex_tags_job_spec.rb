require 'rails_helper'

RSpec.describe ReindexTagsJob, type: :job do
  describe '#perform' do
    it 'calls reindex method on Dream model' do
      expect(Dream).to receive(:reindex)

      ReindexTagsJob.new.perform
    end
  end
end
