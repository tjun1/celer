package main

import (
	"flag"
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

func deploy(ltype string) {
	//log.SetFlags(log.Lshortfile)

	langCollection := make(map[string]string)
	langCollection["golang"] = "docker-golang-env"
	langCollection["clang"] = "docker-clang-9-env"
	langCollection["gcc"] = "docker-gcc-env"
	langCollection["ruby"] = "docker-ruby-env"

	var lang string
	var langPath string
	switch ltype {
	case "clang":
		lang = langCollection["clang"]
	case "golang":
		lang = langCollection["golang"]
	case "ruby":
		lang = langCollection["ruby"]
	case "gcc":
		lang = langCollection["gcc"]
	default:
		flag.Usage()
	}

	statikFS, err := fs.New()
	if err != nil {
		log.Fatal(err)
	}

	err = fs.Walk(statikFS, "/", func(path string, info os.FileInfo, err error) error {
		if path == "/" {
			return err
		}

		replacedPath := strings.Replace(path, "/", "", 1)
		dirpath := filepath.Join("/tmp", replacedPath)
		if replacedPath == lang {
			langPath = dirpath
		}
		// ディレクトリがなければ作る
		if info.IsDir() {
			_, err := os.Stat(dirpath)
			if err == nil {
				return err
			} else {
				err = os.Mkdir(dirpath, 0755)
				if err != nil {
					log.Printf("作れませんでした: %s", dirpath)
					return err
				} else {
					//debug
					// log.Printf("作れた: %s\n", dirpath)
				}
			}
			return err
		}

		b, err := fs.ReadFile(statikFS, path)
		if err != nil {
			log.Fatal(err)
			return err
		}

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

	// TODO: プログラミング言語の種類に対応する
	//list, err := ioutil.ReadDir("/tmp/docker-golang-env")
	//fmt.Println(langPath)
	list, err := ioutil.ReadDir(langPath)
	if err != nil {
		log.Fatal(err)
		os.Exit(1)
	}

	for _, finfo := range list {
		srcPath := filepath.Join(langPath, finfo.Name())
		err = os.Rename(srcPath, finfo.Name())
		if err != nil {
			log.Fatal(err)
			os.Exit(1)
		}
	}

	log.Println("...done")
	os.Exit(0)
}

func Show(path string, info os.FileInfo, err error) error {
	fmt.Println(path, info.Name(), err)
	return nil
}

func main() {
	const CELER_VERSION = "v0.9.8"

	flag.Usage = func() {
		fmt.Fprintf(os.Stderr, "Usage: %s <option> <value>\n\n", os.Args[0])
		flag.PrintDefaults()
	}
	var (
		ltype   = flag.String("t", "golang", "Language type Choice")
		debug   = flag.Bool("debug", false, "Debug Mode enabled?")
		version = flag.Bool("v", false, "Show version")
	)
	flag.Parse()

	if *version {
		fmt.Println(CELER_VERSION)
		os.Exit(0)
	}

	if *debug {
		fmt.Printf("param -m -> %s\n", *ltype)
		fmt.Printf("param -t -> %t\n", *debug)
	}

	switch *ltype {
	case "golang":
		deploy("golang")
	case "clang":
		deploy("clang")
	case "ruby":
		deploy("ruby")
	case "gcc":
		deploy("gcc")
	default:
		flag.Usage()
	}
}
