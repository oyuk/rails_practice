require 'rails_helper'

describe 'routing' do
  it '職員トップページ' do
    expect(get: 'http://localhost:4000/staff').to route_to(
      controller: 'staff/top',
      action: 'index'
    )
  end
  it '管理者ログインフォーム' do
    expect(get: 'http://localhost:4000/admin/login').to route_to(
      controller: 'admin/sessions',
      action: 'new'
    )
  end
  it 'ホスト名が対象外ならerrors/not_foundへ' do
    expect(get: 'http://local').to route_to(
      controller: 'errors',
      action: 'routing_error'
    )
  end
    it '存在しないパスならerrors/not_foundへ' do
    expect(get: 'http://localhost:4000/fjeo').to route_to(
      controller: 'errors',
      action: 'routing_error',
      anything: 'fjeo'
    )
  end

end
