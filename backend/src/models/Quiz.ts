export interface Quiz {
  id: number
  text: string
  answers: {
    id: number
    text: string
    correct: boolean
  }[]
}

export const quizzes: Quiz[] = [
  {
    id: 0,
    text: 'What is the best bank?',
    answers: [
      {
        id: 0,
        text: 'TatraBanka',
        correct: true
      },
      {
        id: 1,
        text: 'SuperBank',
        correct: false
      },
      {
        id: 2,
        text: 'NotTatraBanka',
        correct: false
      },
      {
        id: 3,
        text: 'PishkotkiBank',
        correct: false
      }
    ]
  }
]
