require 'rails_helper'

RSpec.feature 'User visits login' do
  scenario 'User visits the login page' do
    visit login_path
    expect(page).to have_title 'Log in | Ruby on Rails Tutorial Sample App'
  end
end
