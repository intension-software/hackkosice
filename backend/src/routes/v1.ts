import express from 'express'

import AuthenticationController from '../controllers/AuthenticationController'
import MissionController from '../controllers/MissionController'
import QuizController from '../controllers/QuizController'

const router = express.Router()

router.get('/', (req, res) => {
  res.status(200)
  res.json({
    message: 'V1 API'
  })
})

// User
router.post('/register',
  AuthenticationController.register)

router.post('/login',
  AuthenticationController.login)

router.get('/user/:id',
  AuthenticationController.getUserInfo)

// Mission
router.get('/missions',
  MissionController.getAllMissions)

router.get('/mission/:id',
  MissionController.getMission)

router.post('/mission',
  MissionController.postMission)

router.patch('/mission/:id',
  MissionController.updateMission)

router.patch('/mission/:id/complete',
  MissionController.markMissionAsCompleted)

router.patch('/mission/:id/approve',
  MissionController.markMissionAsApproved)

router.patch('/mission/claim/:userId',
  MissionController.claimMissions)

router.delete('/mission/:id',
  MissionController.deleteMission)

// Quiz
router.get('/quizzes',
  QuizController.getAllQuestions)

router.get('/quiz/:id',
  QuizController.getQuestion)

export default router
