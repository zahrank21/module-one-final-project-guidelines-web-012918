Company.delete_all
Job.delete_all
Location.delete_all

dummy_facebook = Company.create(name: "dummy_facebook")
dummy_google = Company.create(name: "dummy_google")
dummy_apple = Company.create(name: "dummy_apple")

dummy_software_engineer = Job.create(name: "dummy_software_engineer")
dummy_android_dev = Job.create(name: "dummy_android_dev")
dummy_ios_dev = Job.create(name: "dummy_ios_dev")

dummy_sf = Location.create(name: "dummy_sf")
dummy_nyc = Location.create(name: "dummy_nyc")
dummy_seattle = Location.create(name: "dummy_seattle")
# hotline_bling = Song.create(:name=>'Hotline Bling')
# thriller = Song.create(:name=>'Thriller')
#
# drake = Artist.create(:name=>'Drake')
# mj = Artist.create(:name=>'Michael Jackson')
#
# rap = Genre.create(:name=>'Rap')
# pop = Genre.create(:name=>'Pop')
#
# hotline_bling.artist = drake
# thriller.artist = mj
#
# drake.songs << hotline_bling
# mj.songs << thriller
#
# pop.songs << thriller
# rap.songs << hotline_bling
