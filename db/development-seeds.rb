# -*- coding: utf-8 -*-
[
 { fullname: 'テスト 一号', nick: '一号', yomi: 'テストイチゴウ' },
 { fullname: 'テスト 二号', nick: '二号', yomi: 'テストニゴウ' },
 { fullname: 'テスト 三号', nick: '三号', yomi: 'テストサンゴウ' },
].each do |m|
  member = Member.find_or_create_by(fullname: m[:fullname])
  member.update(nick: m[:nick], yomi: m[:yomi])
  puts 'Added: ' << member.fullname
end
