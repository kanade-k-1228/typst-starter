#import "@preview/codelst:2.0.2": sourcecode

#let doujinshi(
  title: "かなでの技術書",
  subtitle: "テンプレートだよ",
  author: "Kanade",
  twitter: "@kanade_k_1228",
  note: [],
  prologue: [],
  epilogue: [],
  colophon: [],
  font: "Rounded Mplus 1c",
  paper: "a5",
  doc,
) = [
  #set page(paper: paper)
  #set text(font: font)
  #set line(length: 100%)

  //-----------------------------------

  #title
  #subtitle
  [著] #author
  #twitter
  #pagebreak()

  //-----------------------------------

  #note
  #pagebreak()

  //-----------------------------------

  #text(size: 16pt, weight: "bold")[まえがき]
  #line()
  #prologue
  #pagebreak()

  //-----------------------------------

  #show outline.entry.where(level: 1): it => {
    strong(it)
  }
  #outline(title: "目次", indent: auto)

  //-----------------------------------
  // 本文

  #set page(header: [
    #align(
      left + bottom,
      [
        #text("章名未設定", size: 8pt)
        #line(stroke: 0.5pt)
      ],
    )
  ])

  #counter(page).update(1)
  #set page(numbering: "1")

  // 章番号の設定
  #set heading(
    level: auto,
    numbering: "1.1.",
  )

  #set par(first-line-indent: 1em)

  #doc

  #pagebreak()

  //-----------------------------------

  #set heading(numbering: none)

  #text(size: 16pt, weight: "bold")[あとがき]
  #epilogue

  #text(size: 16pt, weight: "bold")[著者紹介]
  #align(bottom)[
    #text(size: 14pt)[#title] \
    #text(size: 10pt)[#subtitle]
    #line()
    #colophon
    #line()
  ]
]

// 免責事項
#let menseki = (time: "2024年12月") => [
  #text(size: 8pt)[
    - 本書は #time 時点での情報に基づいて執筆されたものです。
    - 本書に記載された内容は情報の提供のみを目的としております。特定の使用目的に対して保証をするものではありません。
    - 本書に記載されている会社名・製品名等は、一般に各社の商標または登録商標です。本文中では商標記号(®、™)の表記は省略しています。
  ]
]

// 凡例
#let hanrei = () => [
  プログラムコードは次のように表⽰します。

  #sourcecode[```
    print("Hello, world!\n"); @<balloon>{コメント}
    ```]

  ターミナル画⾯は次のように表⽰します。

  #sourcecode[```
    $ echo Hello
    ```]

  本⽂に対する補⾜情報は次のように表⽰します。

  //note[ノートタイトル]{
  ノートは本⽂に対する補⾜情報です。
  //}

]

#let note = (body, title: []) => [
  #text(style: "oblique", size: 12pt)[#title]:
  #body
]
