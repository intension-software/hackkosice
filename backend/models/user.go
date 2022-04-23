package models

// album represents data about a record album.
type User struct {
	ID       string `json:"id"`
	IsAdult  bool   `json:"isAdult"`
	Password string `json:"password"`
	Email    string `json:"email"`
}
