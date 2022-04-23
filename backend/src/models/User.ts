export interface User {
  id: number
  email: string
  password: string
  firstName: string
  isAdult: boolean
  toClaim: number
  balance: number
}

export const users: User[] = [
  { id: 0, email: 'parent@example.com', password: 'test', firstName: 'Parent', isAdult: true, toClaim: 0, balance: 1100.35 },
  { id: 1, email: 'child@example.com', password: 'test', firstName: 'Child', isAdult: false, toClaim: 0, balance: 3.44 }
]
