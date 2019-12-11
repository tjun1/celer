package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"path/filepath"
	"strings"

	"github.com/rakyll/statik/fs"
	_ "github.com/tjun1/celer/statik"
)

// コードジェネレータが付いている
//go:generate statik -src=files -f

func main() {
	log.SetFlags(log.Lshortfile)
	statikFS, err := fs.New()
	if err != nil {
		log.Fatal(err)
	}

	// debug
	// s := string(b)
	// fmt.Print(s)

	// debug
	if err := fs.Walk(statikFS, "/", Show); err != nil {
		panic(err)
	}

	err = fs.Walk(statikFS, "/", func(path string, info os.FileInfo, err error) error {
		fmt.Printf("やります: %s\n", info.Name())

		if path == "/" {
			fmt.Println("スキップ \"/\"")
			return err
		}

		replaced_path := strings.Replace(path, "/", "", 1)
		fmt.Println("replaced: " + replaced_path)
		// dirpath := filepath.Join("/tmp", info.Name())
		dirpath := filepath.Join("/tmp", replaced_path)

		// ディレクトリがなければ作る
		if info.IsDir() {
			fmt.Printf("IsDir(): %s\n", replaced_path)
			_, err := os.Stat(dirpath)
			if err == nil {
				fmt.Printf("存在した: %s\n", dirpath)
				return err
			} else {
				fmt.Printf("存在しなかった: %s\n", dirpath)
				err = os.Mkdir(dirpath, 0755)
				if err != nil {
					log.Printf("作れませんでした: %s", dirpath)
					return err
				} else {
					log.Printf("作れた: %s\n", dirpath)
				}
			}
			return err
		}

		b, err := fs.ReadFile(statikFS, path)
		if err != nil {
			log.Fatal(err)
			return err
		}

		fmt.Printf("ファイルを作ります: %s\n", dirpath)
		err = ioutil.WriteFile(dirpath, b, 0644)
		if err != nil {
			log.Fatal(err)
			return err
		}

		return nil
	})

	if err != nil {
		log.Fatal(err)
		os.Exit(1)
	}

	// err = os.Rename("/tmp/docker-golang-env", "./docker-golang-env")
	// if err != nil {
	// 	log.Fatal(err)
	// }

	list, err := ioutil.ReadDir("/tmp/docker-golang-env")
	if err != nil {
		log.Fatal(err)
		os.Exit(1)
	}

	fmt.Println("---------------------------")

	for _, finfo := range list {
		fmt.Println(finfo.Name())
		srcpath := filepath.Join("/tmp/docker-golang-env", finfo.Name())
		err = os.Rename(srcpath, finfo.Name())
		if err != nil {
			log.Fatal(err)
			os.Exit(1)
		}
	}
}

func Show(path string, info os.FileInfo, err error) error {
	fmt.Println(path, info.Name(), err)
	return nil
}
