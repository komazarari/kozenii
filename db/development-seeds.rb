# -*- coding: utf-8 -*-

puts '### Setting up Members ###'
[
 { fullname: 'テスト 一号', nick: '一号', yomi: 'テストイチゴウ' },
 { fullname: 'テスト 二号', nick: '二号', yomi: 'テストニゴウ' },
 { fullname: 'テスト 三号', nick: '三号', yomi: 'テストサンゴウ' },
].each do |m|
  member = Member.find_or_create_by(fullname: m[:fullname])
  member.update(nick: m[:nick], yomi: m[:yomi])
  puts 'Updated member: ' << member.fullname
end

puts '### Setting up Parts ###'
[
 { name: 'パート1', show_order: 1 },
 { name: 'パート3', show_order: 3 },
 { name: 'パート4', show_order: 4 },
 { name: 'パート2', show_order: 2 },
].each do |p|
  part = Part.find_or_create_by(name: p[:name])
  part.update(show_order: p[:show_order])
  puts 'Updated part: ' << part.name
end
