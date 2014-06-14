namespace :testdata do
  desc "Create Sample test data"

  task insert: :environment do
    require File.join(Rails.root, 'db', "#{Rails.env}-seeds.rb")
  end
end
