package main

import (
	"flag"
	"fmt"
	"io"
	"io/ioutil"
	"log"
	"os"
	"path/filepath"

	"github.com/rakyll/statik/fs"
	_ "github.com/tjun1/celer/statik" // こいつが必要
)

// コードジェネレータが付いている
//go:generate statik -src=files -f

func deploy(ltype string) {
	//log.SetFlags(log.Lshortfile)

	langCollection := make(map[string]string)
	langCollection["golang"] = "/docker-golang-env"
	langCollection["clang"] = "/docker-clang-9-env"
	langCollection["gcc"] = "/docker-gcc-env"
	langCollection["ruby"] = "/docker-ruby-env"
	langCollection["python"] = "/docker-python-env"

	//var lang string
	var langPath string
	switch ltype {
	case "clang":
		langPath = langCollection["clang"]
	case "golang":
		langPath = langCollection["golang"]
	case "ruby":
		langPath = langCollection["ruby"]
	case "gcc":
		langPath = langCollection["gcc"]
	case "python":
		langPath = langCollection["python"]
	default:
		flag.Usage()
	}

	FS, err := fs.New()
	if err != nil {
		log.Fatal(err)
	}
	f, err := FS.Open(langPath)
	if err != nil {
		log.Fatal(err)
	}
	defer f.Close()

	io.Copy(os.Stdout, f)
	//fmt.Println(f)
	if err != nil {
		log.Fatal(err)
	}

	err = fs.Walk(FS, langPath, func(path string, info os.FileInfo, err error) error {
		// 宛先のディレクトリ

		fmt.Println("読みこんでいるファイル", path)
		dstPath := filepath.Join(`/tmp`, path)
		fmt.Println("宛先のファイル", dstPath)

		// path 名が langPath ならディレクトリとして作る
		if info.IsDir() {
			err = os.Mkdir(dstPath, 0755)
			if err != nil {
				fmt.Print("ディレクトリの作成に失敗")
				return err
			}
			return nil
		}
		// path 名がファイルなら
		b, err := fs.ReadFile(FS, path)
		if err != nil {
			log.Fatal("ファイルが読み込めない")
			log.Fatal(err)
			return err
		}
		err = ioutil.WriteFile(dstPath, b, 0644)
		if err != nil {
			log.Fatal("ファイルの作成に失敗しています")
			log.Fatal(err)
			return err
		}

		return nil
	})

	// テンポラリファイルをカレントディレクトリにコピーする
	tmpPath := filepath.Join(`/tmp`, langPath)
	fmt.Println("テンポラリのディレクトリ", tmpPath)

	fileList, err := ioutil.ReadDir(tmpPath)
	if err != nil {
		log.Fatal(err)
		os.Exit(1)
	}

	cPath, err := os.Getwd()
	if err != nil {
		log.Fatal("カレントディレクトリが習得できない")
		log.Fatal(err)
		os.Exit(1)
	}
	for _, finfo := range fileList {

		fmt.Println("finfo.Name(): ", finfo.Name())
		tmpFile := filepath.Join(tmpPath, finfo.Name())
		fmt.Println(tmpFile)
		targetFile := filepath.Join(cPath, finfo.Name())
		fmt.Println("cPath: ", cPath)
		fmt.Println("target: ", targetFile)
		err = os.Rename(tmpFile, targetFile)
		if err != nil {
			log.Fatal("リネームコピーできなかった")
			log.Fatal(err)
			os.Exit(1)
		}
	}

	// 片付け
	if err := os.RemoveAll(tmpPath); err != nil {
		log.Fatal("片付けできなかった")
		log.Fatal(err)
		os.Exit(1)
	}
	log.Println("...done")
	os.Exit(0)

}

func Show(path string, info os.FileInfo, err error) error {
	fmt.Println(path, info.Name(), err)
	return nil

}

func main() {
	const CELER_VERSION = "v0.9.16"

	flag.Usage = func() {
		fmt.Fprintf(os.Stderr, "Usage: %s <option> <value>\n\n", os.Args[0])
		flag.PrintDefaults()
	}

	var (
		ltype    = flag.String("t", "golang", "Language type Choice")
		typeList = flag.Bool("l", false, "List language type")
		debug    = flag.Bool("debug", false, "Debug Mode enabled?")
		version  = flag.Bool("v", false, "Show version")
	)
	flag.Parse()

	if *version {
		fmt.Println(CELER_VERSION)
		os.Exit(0)
	}

	if *typeList {
		fmt.Println("golang, clang, ruby, gcc, python")
		os.Exit(0)
	}

	if *debug {
		fmt.Printf("param -m -> %s\n", *ltype)
		fmt.Printf("param -t -> %t\n", *debug)
	}

	switch *ltype {
	case "golang":
		fmt.Println("golang deploying...")
		deploy("golang")
	case "clang":
		fmt.Println("clang deploying")
		deploy("clang")
	case "ruby":
		fmt.Println("ruby deploying")
		deploy("ruby")
	case "gcc":
		fmt.Println("gcc deploying")
		deploy("gcc")
	case "python":
		fmt.Println("python deploying")
		deploy("python")
	default:
		flag.Usage()
	}

}
