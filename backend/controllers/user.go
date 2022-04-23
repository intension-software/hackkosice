package controllers

import (
	"net/http"
	"tatrabanka/backend/data"
	"tatrabanka/backend/models"

	"github.com/gin-gonic/gin"
)

// getUsers responds with the list of all albums as JSON.
func GetUsers(c *gin.Context) {
	c.IndentedJSON(http.StatusOK, data.Users)
}

func LoginUser(c *gin.Context) {
	var user models.User
	c.BindJSON(&user)
	for _, u := range data.Users {
		if u.Email == user.Email && u.Password == user.Password {
			c.JSON(http.StatusOK, gin.H{"id": u.ID, "isAdult": u.IsAdult, "email": u.Email})
			return
		}
	}
	c.JSON(http.StatusOK, gin.H{"error": "User not found"})
}
