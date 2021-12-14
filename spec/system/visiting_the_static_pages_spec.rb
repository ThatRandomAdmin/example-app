# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User visits static pages' do
  scenario 'User visits the homepage' do
    visit '/'
    expect(page).to have_title 'Home | Ruby on Rails Tutorial Sample App'
  end
  scenario 'User visits the about page' do
    visit '/static_pages/about'
    expect(page).to have_title 'About | Ruby on Rails Tutorial Sample App'
  end
  scenario 'User visits the contact page' do
    visit '/static_pages/contact'
    expect(page).to have_title 'Contact | Ruby on Rails Tutorial Sample App'
  end
  scenario 'User visits the help page' do
    visit '/static_pages/help'
    expect(page).to have_title 'Help | Ruby on Rails Tutorial Sample App'
  end
end
