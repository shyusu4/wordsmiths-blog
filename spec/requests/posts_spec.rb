require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET/index' do
    it 'should pass with status 200' do
        get '/users/120/posts'
        expect(response.status).to eql(200)
        expect(response).to render_template(:index)
        expect(response.body).to include('List of posts by given user')
      end
  end
end