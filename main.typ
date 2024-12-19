#import "template.typ": doujinshi
#import "@preview/codelst:2.0.2": sourcecode

#show: doujinshi.with(
  title: [Typst Starterで作る同人誌],
  subtitle: [簡単＆軽量なtypstで本を作ってみよう！],
  author: "Kanade",
  id: "@kanade_k_1228",
  date: datetime(year: 2024, month: 12, day: 30),
  prologue: include "prologe.typ",
  epilogue: include "epiloge.typ",
  okuduke: [
    2024年12月20日 初版第1刷発行
    #table(
      stroke: none,
      columns: 2,
      [著者], [Kanade],
      [発行者], [Kanade],
      [連絡先], [https://twitter.com/kanade_k_1228],
    )
  ],
)

= typst の環境構築

typsは環境構築がとても簡単です。

== ローカル環境構築

=== リポジトリのクローン

このGitHubリポジトリをテンプレートとして、自分のリポジトリを作成してください。

#figure(
  image("./img/fork_as_template.png"),
  caption: [テンプレートとしてフォークする],
)

作成したリポジトリをローカルにクローンしてください。

#sourcecode[```bash
  $ git clone <your-repository-url>
  $ cd <your-repository-name>
  ```]

=== Cargoのインストール

typstはRustで書かれているので、まずはRustのパッケージマネージャであるCargoをインストールします。


公式ドキュメント #footnote[https://doc.rust-lang.org/cargo/getting-started/installation.html] のインストール手順に従ってください。

基本的に次のコマンドを実行するだけです。

#sourcecode[```bash
  $ curl https://sh.rustup.rs -sSf | sh
  ```]

=== typst のインストール

Cargoがインストールされたら、次にtypstをインストールします。

#sourcecode[```bash
  $ cargo install typst
  ```]

=== フォントをインストール

Google font から `.ttf` ファイルをダウンロードしてください。Windows の場合はシステムにフォントをインストール、Linux の場合はフォントファイルを `~/.fonts` 以下に配置してください。次のコマンドで使用可能なフォント一覧が見れます。

#sourcecode[```bash
  $ typst fonts
  ```]

=== コンパイル

次のコマンド一発でコンパイルできます。

#sourcecode[```bash
  $ typst compile main.typ
  ```]

== テンプレートの使い方

=== インポート

=== まえがき・あとがき

=== 本文

= 本の印刷

== 印刷所

== 表紙

== 入稿

= いざコミケへ！

== ブースの準備

== 当日
