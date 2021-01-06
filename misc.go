package main

import (
	"fmt"
	"reflect"
)

func typeP(t interface{}) {
	fmt.Println(reflect.TypeOf(t))
}
