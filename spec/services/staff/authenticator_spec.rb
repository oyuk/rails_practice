require 'rails_helper'

describe Staff::Authenticator do
  describe '#authenticate' do
    it '正しいパスワードならtrueを返す' do
      m = build(:staff_member)
      expect(Staff::Authenticator.new(m).authenticate('pw')).to be_truthy
    end

    it '誤ったパスワードならfasleを返す' do
      m = build(:staff_member)
      expect(Staff::Authenticator.new(m).authenticate('aa')).to be_falsey
    end

    it 'パスワード未設定ならfalseを返す' do
      m = build(:staff_member)
      expect(Staff::Authenticator.new(m).authenticate('nil')).to be_falsey
    end

    it '停止フラグが立っていればfalseを返す' do
      m = build(:staff_member, suspended:true)
      expect(Staff::Authenticator.new(m).authenticate('pw')).to be_falsey
    end

    it '開始前ならfasleを返す' do
      m = build(:staff_member,start_date: Date.tomorrow)
      expect(Staff::Authenticator.new(m).authenticate('pw')).to be_falsey
    end

    it '終了後ならfasleを返す' do
      m = build(:staff_member,end_date: Date.today)
      expect(Staff::Authenticator.new(m).authenticate('pw')).to be_falsey
    end

  end
end
