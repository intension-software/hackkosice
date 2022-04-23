package data

import "tatrabanka/backend/models"

var Users = []models.User{
	{ID: "1", IsAdult: true, Email: "rodic@gmail.com", Password: "rodic"},
	{ID: "2", IsAdult: false, Email: "dieta@gmail.com", Password: "dieta"},
}
