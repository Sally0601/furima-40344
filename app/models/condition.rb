class Condition < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '新品・未使用' },
    { id: 2, name: '未使用に近い' },
    { id: 3, name: '目立った傷や汚れなし' },
    { id: 4, name: '未使用に近い' },
    { id: 5, name: 'やや傷や汚れあり' },
    { id: 6, name: '傷や汚れあり' },
    { id: 7, name: '全体的に状態が悪い' }
  ]

  def items
    Item.where(condition_id: id)
  end
end