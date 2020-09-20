FactoryBot.define do
  factory :music_genre do
    association :music
    association :genre
  end
end
