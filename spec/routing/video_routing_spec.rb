require 'rails_helper'

describe 'Video Routing' do
  describe 'GET /videos' do
    it 'routes to #index' do
      expect(get: '/videos').to route_to('videos#index')
    end
  end

  describe 'GET /videos/1' do
    it 'routes to #show' do
      expect(get: '/videos/1').to route_to('videos#show', id: '1')
    end
  end

  describe 'POST /videos' do
    it 'matches no route' do
      expect(post: '/videos').not_to be_routable
    end
  end

  describe 'PATCH /videos/1' do
    it 'matches no route' do
      expect(patch: '/videos/1').not_to be_routable
    end
  end

  describe 'DELETE /videos/1' do
    it 'matches no route' do
      expect(delete: '/videos/1').not_to be_routable
    end
  end
end