class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '自然' },
    { id: 3, name: '絶景' },
    { id: 4, name: '海' },
    { id: 5, name: 'グルメ' },
    { id: 6, name: '温泉・旅館' },
    { id: 7, name: 'ドライブ' }
]
end
