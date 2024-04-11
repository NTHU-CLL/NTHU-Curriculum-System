package basic

import (
	Object "NTHU-CCS/pkg/object"
	"encoding/json"
	"io"
	"log"
	"net/http"
)

func GetCourseData(url string) []Object.Course {
	resp, err := http.Get(url)
	if err != nil {
		log.Println("Error:\nFailed to download json data:\n", err)
		return nil
	}
	defer resp.Body.Close()

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		log.Println("Error:\nFailed to read json data:\n", err)
		return nil
	}

	var NewCourses []Object.Course

	err = json.Unmarshal(body, &NewCourses)
	if err != nil {
		log.Println("Error:\nFailed to decode json data:\n", err)
		return nil
	}

	return NewCourses
}
