package main

import (
	API "NTHU-CCS/pkg/api"
	Basic "NTHU-CCS/pkg/basic"
	"log"
	"os"
)

const (
	UrlCourseData = "https://www.ccxp.nthu.edu.tw/ccxp/INQUIRE/JH/OPENDATA/open_course_data.json"
)

func init() {
	go Basic.AutoUpdate(UrlCourseData)
}

func main() {
	log.Println("### NTHU Curriculum System")

	if len(os.Args) < 2 {
		log.Fatal("Error : Please provide the port number to listen on.")
		return
	}

	API.CreateRouter(os.Args[1])
}
