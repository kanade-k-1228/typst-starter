# typst starter

技術同人誌用の typst テンプレート

## ローカル環境構築

1. [cargo](https://doc.rust-lang.org/cargo/getting-started/installation.html) をインストール

```bash
curl https://sh.rustup.rs -sSf | sh
```

2. typst をインストール

```bash
cargo install typst-cli
```

3. フォントをインストール

Google font から `.ttf` ファイルをダウンロードしてください。Windows の場合はシステムにフォントをインストール、Linux の場合はフォントファイルを `~/.fonts` 以下に配置してください。次のコマンドで使用可能なフォント一覧が見れます。

```bash
typst fonts
```

4. コンパイル

```bash
typst compile main.typ
```
