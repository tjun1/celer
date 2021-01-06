package main

import (
	"flag"
	"fmt"
	"os"

	_ "github.com/tjun1/celer/statik" // こいつが必要
)

// コードジェネレータが付いている
//go:generate statik -src=assets -include=* -f

const CelerVersion = "v0.9.20"

// 使い方:
// -t オプション: 開発作業に利用するプログラミング言語を選択する
// -l オプション: 利用できるプログラミング言語をリストする
// -debug オプション: デバッグ情報を出力する
// -v オプション: バージョン番号を出力する
func main() {
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
		fmt.Println(CelerVersion)
		os.Exit(0)
	}

	if *typeList {
		// TODO: ここら辺は列挙型にでもしておくか
		fmt.Println("golang, clang, ruby, gcc, python, node")
		os.Exit(0)
	}

	if *debug {
		fmt.Printf("param -m -> %s\n", *ltype)
		fmt.Printf("param -t -> %t\n", *debug)
		Listing()
		os.Exit(0)
	}

	deploy(string(*ltype))
}
