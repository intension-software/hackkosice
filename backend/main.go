package main

import (
	"tatrabanka/backend/controllers"

	"github.com/gin-gonic/gin"
)

func main() {
	router := gin.Default()
	router.GET("/albums", controllers.GetAlbums)
	router.POST("/login", controllers.LoginUser)

	router.Run("localhost:8080")
}
