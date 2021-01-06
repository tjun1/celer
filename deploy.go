package main

import (
	"flag"
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"path/filepath"

	"github.com/rakyll/statik/fs"
)

func deploy(cartridgeName string) {
	// 念のためのキャスト
	cartridgePath := choice(string(cartridgeName))

	// マッチしなければ終了
	if cartridgePath == "not compatible" {
		flag.Usage()
		os.Exit(0)
	}

	fmt.Println(cartridgeName, "deploying...")
	//log.SetFlags(log.Lshortfile)

	FS, err := fs.New()
	if err != nil {
		log.Fatal(err)
	}

	err = fs.Walk(FS, cartridgePath, func(path string, info os.FileInfo, err error) error {
		// 宛先のディレクトリ
		fmt.Println("読みこんでいるファイル", path)
		dstPath := filepath.Join(`/tmp`, path)
		//fmt.Println("宛先のファイル", dstPath)

		// path 名が cartridgePath ならディレクトリとして作る
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
	tmpPath := filepath.Join(`/tmp`, cartridgePath)
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
