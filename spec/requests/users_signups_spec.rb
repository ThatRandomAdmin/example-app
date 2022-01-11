require 'rails_helper'

RSpec.describe 'UsersSignups', type: :request do
  before do
    ActionMailer::Base.deliveries.clear
  end

  describe 'GET signup_path' do
    subject { get signup_path }

    scenario 'visiting singup page' do
      expect(subject).to render_template('users/new')
    end
  end

  scenario 'invalid signup information' do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: '',
                                         email: 'user@invalid',
                                         password: 'foo',
                                         password_confirmation: 'bar' } }
    end
    assert_template 'users/new'
  end

  describe 'POST signup_path' do
    scenario 'valid signup information' do
      expect do
        post users_path, params: { user: { name: 'Example User',
                                           email: 'user@example.com',
                                           password: 'password',
                                           password_confirmation: 'password' } }
      end.to change { User.count }.by(1)
      follow_redirect!
      expect(response).to render_template('home')
    end
  end
end
