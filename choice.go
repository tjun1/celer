package main

// -l で指定された文字列から適切なカートリッジを選択する
func choice(cartridgeName string) string {
	// fmt.Println(ltype)
	// TODO: リストされたサポート可能なプログラミング言語をサーチして動的に処理したい
	switch cartridgeName {
	case "clang":
		return "/docker-clang-9-env"
	case "golang":
		return "/docker-golang-env"
	case "ruby":
		return "/docker-ruby-env"
	case "gcc":
		return "/docker-gcc-env"
	case "python":
		return "/docker-python-env"
	case "node":
		return "/docker-nodejs-env"
	default:
		return "not compatible"
	}
}
