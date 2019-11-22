require 'rails_helper'

describe Video do
  around :all do |each|
    VCR.use_cassette('videos') do
      each.run
    end
  end

  describe '.all' do
    subject(:videos) { Video.all(params: params) }
    subject(:pagination) { JSON.parse(videos.zype_response.body).dig('pagination') }
    let(:params) { {} }

    it 'returns first 10 videos by default' do
      expect(videos.length).to eq(10)
      expect(videos.first.title).to eq('Teacher Trial with Ronda Rousey - SNL')

      expect(pagination['current']).to eq(1)
    end

    context 'when second page is requested' do
      let(:params) { { page: 2 } }

      it 'returns second 10 videos' do
        expect(videos.length).to eq(10)
        expect(videos.first.title).to eq('SNL Time-Lapse: Adam Driver Rehearsals')
  
        expect(pagination['current']).to eq(2)
      end
    end
  end
end
