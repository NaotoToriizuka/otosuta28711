FactoryBot.define do
  factory :music do
    association       :user
    name              {'Otosuta教室'}
    content           {'本格防音スタジオを使用した音楽教室です。'}
    genre_id1         {'1'}
    genre_id2         {'2'}
    genre_id3         {'10'}
    representative    {'鈴木'}
    mail              {Faker::Internet.free_email}
    prefecture_id     {'1'}
    post_code         {'123-4567'}
    city              {'横浜市緑区'}
    house_number      {'青山1-1-1'}
    building_name     {'otoutaビル101'}
    hone_number       {'08012345678'}
    station           {'横浜駅'}
    walk              {'10'}
    hour              {'12時〜20時'}
    holiday           {'毎週火曜日'}
    fee               {'1レッスン/60分/5,000円'}
    url               {'https://www.google.com/'}
    remarks           {'定期的にワークショップ開催しております。'}
  end
end
