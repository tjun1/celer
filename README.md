# Celer
Docker を使った開発環境の簡易デプロイツール
サポート状況:
- Clang
- Golang
- Ruby

## インストール方法
PATH の通った場所にバイナリを配置するだけです。

## システム要件
事前に Docker がインストールされている必要があります。

## 使い方
環境をデプロイしたいプログラミング言語を引数にして celer を実行するだけです。

```
$ celer -t ruby
```

カレントディレクトリ上に Docker 関連ファイル、エディタ設定ファイルなどがデプロイされます。


## License
MIT License

## Copyright
Junichi Takahashi [@tjun1] [gaiant.baba at gmail.com]
