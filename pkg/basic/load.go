package basic

import (
	Object "NTHU-CCS/pkg/object"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
)

func GetCourseData(url string) []Object.Course {
	resp, err := http.Get(url)
	if err != nil {
		fmt.Println("Error:\nFailed to download json data:\n", err)
		return nil
	}
	defer resp.Body.Close()

	body, err := io.ReadAll(resp.Body)
	if err != nil {
		fmt.Println("Error:\nFailed to read json data:\n", err)
		return nil
	}

	var NewCourses []Object.Course

	transData, err := ReadFileUTF16(body)
	if err != nil {
		fmt.Println("Error:\nFailed to transform json data:\n", err)
		return nil
	}

	err = json.Unmarshal(transData, &NewCourses)
	if err != nil {
		fmt.Println("Error:\nFailed to unmarshal json data:\n", err)
		return nil
	}

	return NewCourses
}
