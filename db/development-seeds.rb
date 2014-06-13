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

puts '### Setting up Categories ###'
[
 { name: 'レギュラー', basic_due: 20000, ext_due: 15000 },
 { name: 'トライアル', basic_due: 5000, ext_due: 5000 },
 { name: '学生', basic_due: 10000, ext_due: 7000 },
 { name: 'エキストラ', basic_due: 0, ext_due: 0 },
].each do |c|
  category = Category.find_or_create_by(name: c[:name])
  category.update(basic_due: c[:basic_due], ext_due: c[:ext_due] )
  puts 'Updated category: ' << category.name
end
