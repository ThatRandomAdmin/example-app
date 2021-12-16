# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User visits static pages' do
  scenario 'User visits the homepage' do
    visit root_path
    expect(page).to have_title 'Home | Ruby on Rails Tutorial Sample App'
  end

  scenario 'User visits the help page' do
    visit help_path
    expect(page).to have_title 'Help | Ruby on Rails Tutorial Sample App'
  end

  scenario 'User visits the about page' do
    visit about_path
    expect(page).to have_title 'Home | Ruby on Rails Tutorial Sample App'
  end

  scenario 'User visits the contact page' do
    visit contact_path
    expect(page).to have_title 'Contact | Ruby on Rails Tutorial Sample App'
  end
end
