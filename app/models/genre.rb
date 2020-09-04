class Genre < ActiveHash::Base
  self.data = [
    {id: 1, name: '---'},{id: 2, name: 'エレキギター'}, {id: 3, name: 'アコースティックギター'},
    {id: 4, name: 'クラシックギター'}, {id: 5, name: 'ベース'}, {id: 6, name: 'ドラム'},
    {id: 7, name: 'パーカッション'},{id: 8, name: 'ボーカル'}, {id: 9, name: '声楽'},
    {id: 10, name: 'ボイストレーニング'},{id: 11, name: 'ピアノ'}, {id: 12, name: 'エレクトーン'},
    {id: 13, name: 'バイオリン'},{id: 14, name: 'チェロ'}, {id: 15, name: 'ビオラ'},
    {id: 16, name: 'ウッドベース'},{id: 17, name: 'フルート'}, {id: 18, name: 'ハープ'},
    {id: 19, name: 'ウクレレ'},{id: 20, name: 'クラリネット'}, {id: 21, name: 'ファゴット'},
    {id: 22, name: 'トランペット'},{id: 23, name: 'トロンボーン'}, {id: 24, name: 'サックス'},
    {id: 25, name: 'ゴスペル'},{id: 26, name: 'リトミック'}, {id: 27, name: 'ソルフェージュ'},
    {id: 28, name: '琴'},{id: 29, name: '和太鼓'}, {id: 30, name: '古典楽器'},
    {id: 31, name: 'DTM'}
  ]
end
