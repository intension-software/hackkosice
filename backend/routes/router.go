package routes

import (
	"tatrabanka/backend/controllers"

	"github.com/gin-gonic/gin"
)

func InitRoutes(router *gin.Engine) {
	api := router.Group("/api/v1")
	{
		api.GET("/albums", controllers.GetAlbums)
		api.POST("/login", controllers.LoginUser)
	}
}
