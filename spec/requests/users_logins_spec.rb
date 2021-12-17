require 'rails_helper'

RSpec.describe 'UsersLogins', type: :request do
  scenario 'login with invalid information' do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: 'defaultemail@example.com', password: 'invalid' } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
end
