package main

import (
	"tatrabanka/backend/routes"
)

func main() {
	router := routes.InitRoutes()
	router.Run(":8080")
}
