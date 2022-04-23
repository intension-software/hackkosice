import { Request, Response } from 'express'
import { users } from '../models/User'
import { missions } from '../models/Mission'

export default {
  async getAllMissions (req: Request, res: Response) {
    try {
      res.status(200).json(missions)
    } catch (error) {
      res.status(500).json({
        message: 'Cannot get all missions',
        error
      })
    }
  },
  async getMission (req: Request, res: Response) {
    try {
      const mission = await missions.find((mission) => mission.id.toString() === req.params.id)
      res.status(200).json({
        message: 'Mission found',
        mission
      })
    } catch (error) {
      res.status(400).send({
        error: 'Cannot get mission'
      })
    }
  },
  async postMission (req: Request, res: Response) {
    try {
      const mission = await missions.push(req.body)
      res.status(201).json({
        message: 'Mission created',
        mission
      })
    } catch (error) {
      res.status(400).send({
        error: 'Cannot create mission'
      })
    }
  },
  async updateMission (req: Request, res: Response) {
    try {
      const missionIndex = await missions.findIndex((mission) => mission.id.toString() === req.params.id)

      if (missionIndex === -1) {
        return res.status(400).send({
          error: 'Mission does not exist'
        })
      }

      missions[missionIndex] = {
        ...missions[missionIndex],
        ...req.body
      }

      res.status(200).json({
        message: 'Mission updated',
        mission: missions[missionIndex]
      })
    } catch (error) {
      res.status(400).send({
        error: 'Cannot update mission'
      })
    }
  },
  async markMissionAsCompleted (req: Request, res: Response) {
    try {
      const missionIndex = await missions.findIndex((mission) => mission.id.toString() === req.params.id)

      if (missionIndex === -1) {
        return res.status(400).send({
          error: 'Mission does not exist'
        })
      }

      missions[missionIndex].state = 'done'

      res.status(200).json({
        message: 'Mission marked as completed',
        mission: missions[missionIndex]
      })
    } catch (error) {
      res.status(400).send({
        error: 'Cannot mark mission as completed'
      })
    }
  },
  async markMissionAsApproved (req: Request, res: Response) {
    try {
      const missionIndex = await missions.findIndex((mission) => mission.id.toString() === req.params.id)

      if (missionIndex === -1) {
        return res.status(400).send({
          error: 'Mission does not exist'
        })
      }

      missions[missionIndex].state = 'approved'

      const userIndex = await users.findIndex((user) => user.id.toString() === req.body.userId)

      if (userIndex === -1) {
        return res.status(400).send({
          error: 'User does not exist'
        })
      }

      users[userIndex].toClaim += missions[missionIndex].reward.money

      res.status(200).json({
        message: 'Mission marked as approved',
        mission: missions[missionIndex]
      })
    } catch (error) {
      res.status(400).send({
        error: 'Cannot mark mission as approved'
      })
    }
  },
  async claimMissions (req: Request, res: Response) {
    try {
      const userIndex = await users.findIndex((user) => user.id.toString() === req.body.userId)

      if (userIndex === -1) {
        return res.status(400).send({
          error: 'User does not exist'
        })
      }

      const missionsToClaim = missions.filter((mission) => mission.state === 'approved')

      if (missionsToClaim.length === 0) {
        return res.status(400).send({
          error: 'No missions to claim'
        })
      }

      missionsToClaim.forEach((mission) => {
        mission.state = 'claimed'
      })

      users[userIndex].balance += users[userIndex].toClaim
      users[userIndex].toClaim = 0

      res.status(200).json({
        message: 'Missions claimed',
        missions: missionsToClaim
      })
    } catch (error) {
      res.status(400).send({
        error: 'Cannot claim missions'
      })
    }
  },
  async deleteMission (req: Request, res: Response) {
    try {
      const missionIndex = await missions.findIndex((mission) => mission.id.toString() === req.params.id)

      if (missionIndex === -1) {
        return res.status(400).send({
          error: 'Mission does not exist'
        })
      }

      missions.splice(missionIndex, 1)

      res.status(200).json({
        message: 'Mission deleted'
      })
    } catch (error) {
      res.status(400).send({
        error: 'Cannot delete mission'
      })
    }
  }
}
