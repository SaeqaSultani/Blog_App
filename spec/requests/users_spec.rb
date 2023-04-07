require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get users_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Here is a list of users')
    end

    it 'renders the index template' do
      get users_path
      expect(response).to render_template(:index)
    end

  end

  describe 'GET /show' do
    it 'returns http success' do
      get user_path(id: 1)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Here is a spacific user')
    end

    it 'renders the show template' do
      get user_path(id: 1)
      expect(response).to render_template(:show)
    end

  end
end
