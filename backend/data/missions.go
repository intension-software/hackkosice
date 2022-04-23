package data

import "tatrabanka/backend/models"

var Missions = []models.Mission{
	{ID: "1", Content: "Kolik je to?", AnswerA: true, AnswerB: false, AnswerC: false, AnswerD: false},
	{ID: "2", Content: "Kolik je to?", AnswerA: false, AnswerB: false, AnswerC: true, AnswerD: false},
}
