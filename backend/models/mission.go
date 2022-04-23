package models

// album represents data about a record album.
type Mission struct {
	ID      string `json:"id"`
	Content string `json:"content"`
	AnswerA bool   `json:"answerA"`
	AnswerB bool   `json:"answerB"`
	AnswerC bool   `json:"answerC"`
	AnswerD bool   `json:"answerD"`
}
