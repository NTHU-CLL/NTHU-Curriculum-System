package basic

import (
	"NTHU-CCS/pkg/object"
	"fmt"
	"time"
)

type CCS struct {
	RawDatas []object.Course
}

func AutoUpdate() {
	for {
		fmt.Println("### AutoUpdate")
		time.Sleep(5 * time.Second)
	}
}
