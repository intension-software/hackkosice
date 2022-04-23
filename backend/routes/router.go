package routes

import (
	"tatrabanka/backend/controllers"

	"github.com/gin-gonic/gin"
)

func InitRoutes() *gin.Engine {
	router := gin.Default()

	api := router.Group("/api/v1")
	{
		api.GET("/albums", controllers.GetAlbums)
	}

	return router
}
