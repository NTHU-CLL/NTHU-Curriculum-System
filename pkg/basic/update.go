package basic

import (
	Object "NTHU-CCS/pkg/object"
	"time"
)

var Courses []Object.Course

type CCS struct {
	RawDatas []Object.Course
}

func AutoUpdate(url string) {
	for {
		Courses = GetCourseData(url)
		time.Sleep(24 * time.Hour)
	}
}
