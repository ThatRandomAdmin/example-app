require 'rails_helper'

RSpec.feature 'Test user data' do
  before do
    @user = User.new(name: 'ThatRandomAdmin', email: 'thatrandomdev@gmail.com', password: 'foobar', password_confirmation: 'foobar')
  end

  scenario 'is user valid' do
    visit root_path
    assert @user.valid?
  end

  scenario 'name should be present' do
    @user.name = ' '
    expect(@user).not_to be_valid
  end

  scenario 'email should be present' do
    @user.email = ' '
    expect(@user).not_to be_valid
  end

  scenario 'password should be present (nonblank)' do
    @user.password = @user.password_confirmation = ' ' * 6
    expect(@user).not_to be_valid
  end

  scenario 'password should have a minimum length' do
    @user.password = @user.password_confirmation = 'a' * 5
    expect(@user).not_to be_valid
  end

  scenario 'name should not be too long' do
    @user.name = 'a' * 51
    expect(@user).not_to be_valid
  end

  scenario 'email should not be too long' do
    @user.email = ('a' * 244) + '@example.com'
    expect(@user).not_to be_valid
  end

  scenario 'email validation should accept valid addresses' do
    valid_addresses = ['user@example.com', 'USER@foo.COM', 'A_US-ER@foo.bar.org', 'first.last@foo.jp', 'alice+bob@baz.cn']
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  scenario 'email validation should reject invalid addresses' do
    invalid_addresses = ['user@example,com', 'user_at_foo.org', 'user.name@example.', 'foo@bar_baz.com', 'foo@bar+baz.com']
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      expect(@user).not_to be_valid, "#{invalid_address.inspect} should be invalid"
    end
  end

  scenario 'email addresses should be unique' do
    duplicate_user = @user.dup
    @user.save
    expect(duplicate_user).not_to be_valid
  end

  scenario 'email addresses should be saved as lower-case' do
    mixed_case_email = 'Foo@ExAMPle.CoM'
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end
end
