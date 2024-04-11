package main

import (
	API "NTHU-CCS/pkg/api"
	Basic "NTHU-CCS/pkg/basic"
	"log"
)

const (
	UrlCourseData = "https://www.ccxp.nthu.edu.tw/ccxp/INQUIRE/JH/OPENDATA/open_course_data.json"
)

func init() {
	go Basic.AutoUpdate(UrlCourseData)
}

func main() {
	log.Println("### NTHU Curriculum System")

	var listenPort string = "5050"

	API.CreateRouter(listenPort)
}
