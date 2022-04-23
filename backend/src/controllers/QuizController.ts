import { Request, Response } from 'express'
import { quizzes } from '../models/Quiz'

export default {
  async getAllQuestions (req: Request, res: Response) {
    try {
      return res.json(quizzes)
    } catch (error) {
      return res.status(500).json({ message: 'Internal server error' })
    }
  },
  async getQuestion (req: Request, res: Response) {
    try {
      const quiz = await quizzes.find((quiz) => quiz.id.toString() === req.params.id)

      if (!quiz) {
        return res.status(404).json({ message: 'Quiz not found' })
      }

      return res.json(quiz)
    } catch (error) {
      return res.status(500).json({ message: 'Internal server error' })
    }
  }
}
