# -*- coding: utf-8 -*-

puts '### Setting up Seasons'
[
  { index: 3, description: "season 3" },
  { index: 4, description: "season 4" },
  { index: 5, description: "season 5" },
].each do |s|
  season = Season.find_or_create_by(index: s[:index])
  season.update(description: s[:description])
  puts 'Update season: ' << season.description
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
 { name: 'レギュラー', basic_due: 20000, ext_due: 15000, season: 5},
 { name: 'トライアル', basic_due: 5000, ext_due: 5000, season: 5},
 { name: '学生', basic_due: 10000, ext_due: 7000, season: 5},
 { name: 'エキストラ', basic_due: 0, ext_due: 0, season: 5},
].each do |c|
  category = Category.find_or_create_by(name: c[:name])
  season = Season.find_by(index: c[:season])
  category.update(basic_due: c[:basic_due], ext_due: c[:ext_due], season: season )
  puts 'Updated category: ' << category.name
end

puts '### Setting up Groups ###'
[
 { name: '運搬', show_order: 10, season: 5 },
 { name: 'イベント', show_order: 20, season: 5 },
 { name: '会計', show_order: 30, season: 5 },
 { name: '外務', show_order: 40, season: 5 },
 { name: '定期収入', show_order: 1010, season: 5 },
 { name: '臨時収入', show_order: 1020, season: 5 },
].each do |g|
  group = Group.find_or_create_by(name: g[:name])
  season = Season.find_by(index: g[:season])
  group.update(show_order: g[:show_order], season: season)
  puts 'Updated group: ' << group.name
end

puts '### Setting up Budgets ###'
[
 { title: 'レンタカー', amount: 1000, group: '運搬', season: 5 },
 { title: '会場', amount: 1000, group: 'イベント', season: 5 },
 { title: '備品', amount: 1000, group: '会計', season: 5 },
 { title: '郵送', amount: 1000, group: '外務', season: 5 },
 { title: 'コピー', amount: 1000, group: 'イベント', season: 5 },
 { title: 'ガソリン', amount: 1000, group: '運搬', season: 5 },
 { title: '印刷', amount: 1000, group: '外務', season: 5 },
 { title: '年会費', amount: 1000, group: '定期収入', section: 'in', season: 5 },
 { title: '寄付', amount: 1000, group: '臨時収入', section: 'in', season: 5 },
].each do |b|
  budget = Budget.find_or_create_by(title: b[:title])
  group = Group.find_by(name: b[:group])
  season = Season.find_by(index: b[:season])
  budget.update(amount: b[:amount], group: group, section: b[:section] || 'out', season: season)
  puts 'Updated budget: ' << budget.title
end

puts '### Setting up Members ###'
[
 { part: "パート2", category: "レギュラー", fullname: 'テスト 一号', nick: '一号', yomi: 'テストイチゴウ', season: 5 },
 { part: "パート3", category: "学生", fullname: 'テスト 二号', nick: '二号', yomi: 'テストニゴウ', season: 5 },
 { part: "パート2", category: "エキストラ", fullname: 'テスト 三号', nick: '三号', yomi: 'テストサンゴウ', season: 5 },
 { part: "パート4", category: "レギュラー", fullname: 'テスト 四号', nick: '四号', yomi: 'テストヨンゴウ', season: 5 },
].each do |m|
  member = Member.find_or_create_by(fullname: m[:fullname])
  part = Part.find_by(name: m[:part].present? ? m[:part] : %|パート1|)
  category = Category.find_by(name: m[:category])
  season = Season.find_by(index: m[:season])
  member.update(part: part, nick: m[:nick], yomi: m[:yomi], category: category, season: season)
  puts 'Updated member: ' << member.fullname
end
