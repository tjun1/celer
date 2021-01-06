package main

import (
	"fmt"
	"log"
	"os"

	"github.com/rakyll/statik/fs"
)

// Listing はなにかやる
func Listing() {
	langPath := "/docker-golang-env"
	// langPath := "/docker-clang-9-env"
	// langPath := "/docker-ruby-env"
	//langPath := "/docker-python-env"
	//langPath := "/docker-gcc-env"

	FS, err := fs.New()
	if err != nil {
		log.Fatal(err)
	}
	err = fs.Walk(FS, langPath, func(path string, info os.FileInfo, err error) error {
		fmt.Println("読みこんでいるファイル", path)
		// fmt.Println("AAA: ", info.Name())
		return nil
	})
	if err != nil {
		fmt.Println("Walkできなかった")
	}
}
