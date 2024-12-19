#import "@preview/codelst:2.0.2": sourcecode

// -----------------------------------

#let note = (body, title: []) => [
  #text(style: "oblique", size: 12pt)[#title]:
  #body
]


// ノンブル
#let nonble = (page: int) => {
  if calc.odd(page) {
    // 偶数ページは右側奥
    place(left, dx: -14mm, dy: 5mm)[#text(6pt)[#page]]
  } else {
    // 奇数ページは左側奥
    place(right, dx: 14mm, dy: 5mm)[#text(6pt)[#page]]
  }
}

// ページ番号
#let pageno = (page: int) => {
  if page == 1 {
    []
  } else if calc.odd(page) {
    // 偶数ページは左下
    align(right)[#text(10pt)[#here().page()]]
  } else {
    // 奇数ページは右下
    align(left)[#text(10pt)[#here().page()]]
  }
}

// -----------------------------------

#let doujinshi(
  title: "",
  subtitle: "",
  author: "",
  id: "",
  date: datetime.today(),
  prologue: [],
  epilogue: [],
  okuduke: [],
  font: "Rounded Mplus 1c",
  paper: "a5",
  doc,
) = [
  #set page(paper: paper) // 紙サイズの設定
  #set text(font: font) // フォントの設定
  #set line(length: 100%) // 横線は幅100%
  #set par(first-line-indent: 1em) // 段落頭の字下げ
  // 各章最初の段落が字下げされないのは既知の問題です
  // https://github.com/typst/typst/issues/311
  // いずれ修正されることを信じてこのままにしています


  // ページ番号
  #set page(
    header: context { nonble(page: here().page()) },
    footer: context { pageno(page: here().page()) },
  )

  //-----------------------------------
  // 表紙

  #align(center + horizon)[
    #text(size: 20pt)[#title]
    #v(4pt)
    #text(size: 14pt)[#subtitle]
    #v(80pt)
    #text(size: 14pt)[[著] #author]
    #v(1pt)
    #text(size: 14pt)[#id]
    #v(80pt)
    #date.year() 年 #date.month() 月 #date.day() 日
  ]
  #pagebreak()

  //-----------------------------------
  // 免責

  #align(bottom)[
    #text(size: 8pt)[
      - 本書は #date.year() 年 #date.month() 時点での情報に基づいて執筆されたものです。
      - 本書に記載された内容は情報の提供のみを目的としております。特定の使用目的に対して保証をするものではありません。
      - 本書に記載されている会社名・製品名等は、一般に各社の商標または登録商標です。本文中では商標記号(®、™)の表記は省略しています。
    ]
  ]
  #pagebreak()

  //-----------------------------------

  #text(size: 16pt, weight: "bold")[まえがき]
  #line()
  #prologue
  #pagebreak()

  //-----------------------------------
  // 凡例

  #text(size: 16pt)[凡例]
  #line()

  プログラムコードは次のように表⽰します。

  #sourcecode[```
    print("Hello, world!")
    ```]

  ターミナル画⾯は次のように表⽰します。

  #sourcecode[```
    $ echo Hello
    ```]

  本⽂に対する補⾜情報は次のように表⽰します。

  #note(title: [ノート])[
    ノートは本⽂に対する補⾜情報です。
  ]

  #pagebreak()

  //-----------------------------------
  // 目次

  #show outline.entry.where(level: 1): it => {
    strong(it)
  }
  #text(size: 16pt)[目次]
  #line()
  #outline(title: none, indent: auto)

  //-----------------------------------
  // 本文用設定

  // 章番号の設定
  #set heading(level: auto, numbering: "1.1.")

  // 章タイトル
  #show heading.where(level: 1): it => [
    #pagebreak()
    #v(8pt)
    #text(size: 20pt)[第 #context counter(heading).get().at(0) 章]
    #v(8pt)
    #text(size: 20pt)[#it.body]
    #v(8pt)
  ]

  // 節タイトル
  #show heading.where(level: 2): it => [
    #line()
    #text(size: 15pt, weight: "bold")[
      #context counter(heading).display() #it.body
    ]
    #line()
  ]

  // 項タイトル
  #show heading.where(level: 3): it => [
    #text(size: 15pt, weight: "bold")[
      #context counter(heading).display() #it.body
    ]
  ]

  #set figure(supplement: [図])

  //-----------------------------------
  // 本文

  #doc
  #pagebreak()

  //-----------------------------------
  // あとがき

  #text(size: 16pt, weight: "bold")[あとがき]
  #line()
  #epilogue

  #pagebreak()

  // 奥付
  #align(bottom)[
    #text(size: 14pt)[#title]
    #v(1pt)
    #text(size: 10pt)[#subtitle]
    #line()
    #okuduke
    #line()
  ]
]
