package basic

import (
	"reflect"
	"strings"
)

func SearchInStruct(obj interface{}, keyword string) bool {
	val := reflect.ValueOf(obj)

	if val.Kind() == reflect.Ptr {
		val = val.Elem()
	}

	for i := 0; i < val.NumField(); i++ {
		field := val.Field(i)

		if field.Kind() != reflect.String {
			continue
		}

		if strings.Contains(field.String(), keyword) {
			return true
		}
	}

	return false
}
