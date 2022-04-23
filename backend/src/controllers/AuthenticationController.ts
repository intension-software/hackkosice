import { Request, Response } from 'express'
import { users } from '../models/User'

export default {
  async register (req: Request, res: Response) {
    try {
      const user = await users.push(req.body)
      res.status(201).json({
        message: 'User created successfully',
        user
      })
    } catch (error) {
      res.status(400).send({
        error: 'Cannot register user'
      })
    }
  },
  async login (req: Request, res: Response) {
    try {
      const user = users.find((user) => user.email === req.body.email)

      if (!user) {
        return res.status(400).send({
          error: 'User does not exist'
        })
      }

      if (user.password !== req.body.password) {
        return res.status(400).send({
          error: 'Password is incorrect'
        })
      }

      res.status(200).json({
        message: 'User logged in successfully',
        user
      })
    } catch (error) {
      res.status(400).send({
        error: 'Cannot login'
      })
    }
  },
  async getUserInfo (req: Request, res: Response) {
    try {
      const user = users.find((user) => user.id.toString() === req.params.id)
      res.status(200).json(user)
    } catch (error) {
      res.status(500).json({
        message: 'Cannot get info',
        error
      })
    }
  }
}
