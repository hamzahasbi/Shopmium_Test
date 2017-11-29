namespace :Launsh do
  require 'csv'
  desc 'Generate Database'
  task Insert: :environment  do
  file = File.expand_path("../../../db/shops_shopmium.csv", __FILE__)
    CSV.foreach(file, headers: true) do |row|
      ss = Shop.new(:chain => row[0],:name => row[1],:latitude => row[2].to_f,
          :longitude => row[3].to_f,:adress => row[4],:city => row[5],:zip => row[6],
            :phone => row[8], :country_code => row[18])
      if(ss == true) then ss.save()
      end
    end
  end
end
