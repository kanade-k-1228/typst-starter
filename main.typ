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

初心者の方、非ソフトウェアエンジニアの方は、ウェブエディタがおすすめです。
ターミナルに慣れてる方は、CLIのインストールに進んでください。

== ウェブエディタの使い方

== CLIの使い方

=== コンパイル

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
