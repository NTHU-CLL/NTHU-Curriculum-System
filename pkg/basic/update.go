package basic

import (
	"fmt"
	"time"
)

func AutoUpdate() {
	for {
		fmt.Println("### AutoUpdate")
		time.Sleep(5 * time.Second)
	}
}
