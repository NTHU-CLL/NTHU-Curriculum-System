package main

import (
	API "NTHU-CCS/pkg/api"
	Basic "NTHU-CCS/pkg/basic"
	Object "NTHU-CCS/pkg/object"
	"log"
	"os"
)

const (
	UrlCourseData = "https://www.ccxp.nthu.edu.tw/ccxp/INQUIRE/JH/OPENDATA/open_course_data.json"
)

var Courses []Object.Course

func init() {
	//go Basic.AutoUpdate()
	Courses = Basic.GetCourseData(UrlCourseData)
	os.Exit(0)
}

func main() {
	log.Println("### NTHU Curriculum System")

	var listenPort string = "5050"

	API.CreateRouter(listenPort)
}
