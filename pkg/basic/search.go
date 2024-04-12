package basic

import (
	Object "NTHU-CCS/pkg/object"
	"fmt"
)

func SearchCourse() []Object.Course {
	Hits := []Object.Course{}

	for _, course := range Courses {
		fmt.Println(course)
		Hits = append(Hits, course)
	}

	return Hits
}
