package controllers

import (
	"net/http"
	"tatrabanka/backend/data"

	"github.com/gin-gonic/gin"
)

// getMissions responds with the list of all albums as JSON.
func GetMissions(c *gin.Context) {
	c.IndentedJSON(http.StatusOK, data.Missions)
}
