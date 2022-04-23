export interface Mission {
  id: number
  text: string
  due: string
  state: 'created' | 'done' | 'approved' | 'claimed'
  reward: {
    coins: number
    money: number
  }
  parentId: number
  childId: number
}

export const missions: Mission[] = [
  {
    id: 0,
    text: 'Wash dishes',
    state: 'created',
    due: 'Friday',
    reward: {
      coins: 50,
      money: 5
    },
    parentId: 0,
    childId: 1
  },
  {
    id: 1,
    text: 'Buy milk',
    state: 'created',
    due: 'Monday',
    reward: {
      coins: 20,
      money: 2
    },
    parentId: 0,
    childId: 1
  },
  {
    id: 2,
    text: ' Clean your room',
    state: 'created',
    due: 'Today',
    reward: {
      coins: 50,
      money: 5
    },
    parentId: 0,
    childId: 1
  }
]
