require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET/index' do
    it 'should pass with status 200' do
      get '/'
      expect(response.status).to eql(200)
    end

    it 'should render correct template' do
      get '/'
      expect(response).to render_template(:index)
    end

    it 'should include correct text' do
      get '/'
      expect(response.body).to include('List of users')
    end
  end

  describe 'GET/show' do
    it 'should pass with status 200' do
      get '/users/12'
      expect(response.status).to eql(200)
    end

    it 'should render correct template' do
      get '/users/12'
      expect(response).to render_template(:show)
    end

    it 'should include correct text' do
      get '/users/12'
      expect(response.body).to include('List of user by given id')
    end
  end
end
