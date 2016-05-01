require 'rails_helper'

RSpec.describe Administrator, :type => :model do
  describe '#password=' do
    it '文字列を与えるとhashed_passwordは長さ60の文字列になる' do
      administrator = Administrator.new
      administrator.password = 'baukis'
      expect(administrator.hashed_password).to be_kind_of(String)
      expect(administrator.hashed_password.size).to eq(60)
    end

    it 'nilを与えるとhashed_passwordはnil' do
      administrator = Administrator.new(hashed_password: 'x')
      administrator.password = nil
      expect(administrator.hashed_password).to be_nil
    end
  end
end
