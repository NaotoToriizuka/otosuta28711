class Genre < ActiveHash::Base
  has_many :music_genre
  
  self.data = [
    {id: 1, name: 'エレキギター'}, {id: 2, name: 'アコースティックギター'},
    {id: 3, name: 'クラシックギター'}, {id: 4, name: 'ベース'}, {id: 5, name: 'ドラム'},
    {id: 6, name: 'パーカッション'},{id: 7, name: 'ボーカル'}, {id: 8, name: '声楽'},
    {id: 9, name: 'ボイストレーニング'},{id: 10, name: 'ピアノ'}, {id: 11, name: 'エレクトーン'},
    {id: 12, name: 'バイオリン'},{id: 13, name: 'チェロ'}, {id: 14, name: 'ビオラ'},
    {id: 15, name: 'ウッドベース'},{id: 16, name: 'フルート'}, {id: 17, name: 'ハープ'},
    {id: 18, name: 'ウクレレ'},{id: 19, name: 'クラリネット'}, {id: 20, name: 'ファゴット'},
    {id: 21, name: 'トランペット'},{id: 22, name: 'トロンボーン'}, {id: 23, name: 'サックス'},
    {id: 24, name: 'ゴスペル'},{id: 25, name: 'リトミック'}, {id: 26, name: 'ソルフェージュ'},
    {id: 27, name: '琴'},{id: 28, name: '和太鼓'}, {id: 29, name: '古典楽器'},
    {id: 30, name: 'DTM'}
  ]
end
