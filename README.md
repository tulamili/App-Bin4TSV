# App::Bin4TSV

## 概要
- 表形式のテキストデータファイル、特にTSV形式のファイルを扱うためのコマンド群およびその為に発生する周辺的な操作を行うためのコマンド群である。TSVとはTab-Separated Valuesであり、<a href="https://datatracker.ietf.org/doc/html/rfc4180">RFC 4180</a>で定義されている。
<!--なお、このモジュールをインストールすると、同じ作者が作成した、他のCPANモジュール群をインスト
ールする。すなわち、10個程度のモジュール群を一つにまとめた、ラッパーになっている。インストー
ル自体は、1分程度で終わるであろう。-->
- 各コマンドは実体は1個のPerl言語で書かれた、大雑把に50行〜300行程度のブログラムであり、現在、約65個のコマンドが収録されている。
<!--他の仕組みは、それらを実行可能とするために適当なディレクトリに格納したり、オンラインマニュアルを生成したり、アンインストール等に備えて、インストール情報を書き留めるためのものに過ぎない。-->
- 利用には、Unix、Linux、シェルの使い方の知識が必要である。Perl言語プログラミングの知識は必要としない。ただし、何か不具合があった場合にPerlの知識があることは役に立つであろう。また収録したプログラムの改良提案などはPerlの知識は必要である。

## インストール

**インストール方法** は、次の2個のいずれかの方法である。
```
cpanm https://github.com/tulamili/App-Bin4TSV.git
```
もしくは
```
cpanm App::Bin4TSV  
## cpanm -v App::Bin4TSV または cpanm --verbose App::Bin4TSV でインストール途中の詳細も分かる。
```
上記は、30秒程度以内で完了するであろう。<a href="https://metacpan.org/pod/App::Bin4TSV">App::Bin4TSV</a>はCPANモジュールである。`cpanm`コマンドの`cpan`を使っても良いが、それだと準備に時間がかかるであろう。

上記のインストールした後で、**アンインストール**する場合(このソフトウェアの利用を今後しない場合)には、下記を行う。
```
cpanm -U App::Bin4TSV
```
上記により、除去するファイルの一覧が表示される。その時にyキーを押下すると、アンインストールが完了する。


# 各コマンドについて

この節では各コマンドの簡潔な説明を与えることを目的とする。ただし、そのために、この節の前半で注意書きを与え、その後で具体的に各コマンドの説明を短くまとめる。(コマンドの実際の実行結果はこの節には買いてはいない。実際に実行するのが、理解しやすいであろう。)

## 各コマンドの説明における注意事項

その説明はそのコマンドの代表的な機能の説明のみに留まる。下記のような関係すると思われる機能は説明を省略している。

### 下記の説明として省略されていること

1011. App::Bin4TSVは2021年5月29日現在**65個のコマンド**が収録されているが、このページではその全てを説明していない。
12. App::Bin4TSVは8個の別のCPANモジュールが持つコマンドを2021年5月29日にコピーをして作成している。それらのモジュールは同じコマンドが重複している場合がある。またいくつかのモジュールのコマンドについては解説は省略している場合がある(データファイルの、ディレクトリ配置の様子を理解するためのコマンド群は、本ソフトウェアに収録しているが、このページで解説していない)。
13. データはTSV形式を主に前提としているので、各列(各属性)はタブ文字で区切られてることが前提であるように示されているが、実際には、タブ文字以外のコンマなどの他の文字も区切り文字として使えること。(コマンドでは `-i "\t"` や `-i ,` のように、マイナス文字で始まるコマンドスイッチで制御が可能である。)
14. A→Bへの変換が主機能のコマンドに対して、そのコマンドが持つB→Aへの逆変換の機能。

### 各コマンドの機能性、充実性、洗練度に関して

1021. 下記のコマンドは、実装が十分に洗練されているとは限らない。いくつかのコマンドは細やかに小機能が実装されているが、あるコマンドは機能不足な場合がある(▼で下記で示す)し、設計が不十分な場合もある(◆で示す)。

21. 各コマンドは、汎用性、再利用性は高めた作りになっているが、それが十分に成されているとは限らない。

### 用いた用語の表記について

1031. **表**と**テーブル**は同じ意味である。下記でTSV形式のファイルのデータは、暗黙に表であることがよく仮定されている。
31. **行**はそれぞれが横長の要素が、縦方向に集まって表を構成する。各行は**レコード**とも呼ばれる。**属性**とも呼ばれる。
31. **列**はそれぞれが縦長の要素が、横方向に集まって表を構成する。各列は**カラム**とも呼ばれる。
31. 表において、行番号と列番号の両方を指定する、つまり「行と列を指定する」と、**値**が定まる。**出現値**という場合がある。
31. TSVファイルの先頭の行(つまり1行目)はデータの値の並びではなくて、列の名前(列名)の並びであることがある。

41. **オプションスイッチ** のことを単に**オプション**と呼ぶこともあります。Unixのシェルコマンドでマイナス(-)文字に続けて、英数字記号のオプションを指定して、さらにパラメーターを指定することもあります。(Perlプログラム内の`use Getopt::Std`でこの機能を使いました。)

本ソフトウェアでは、「先頭行が列名の並びである場合」に処理がしやすいように、各コマンドは、共通するオプションスイッチ```-=```　
(マイナスの直後にイコール記号)でその場合に対処できるように、してある。

## 各コマンドの説明

ここから、本ソフトウェア(モジュール)が提供するコマンドの具体的な説明になる。重要なコマンドは**太字**で表した。使いやすさや洗練度にはバラツキがあり、十分な水準に無いものは▼や◆の記号を付けた。本ソフトウェアが提供するコマンドのうち、**約25個のコマンド**のみが解説の対象となっている。

本ソフトウェアが提供するコマンド群は大まかに8個に分類できる。それらは、それぞれ対応するCPANモジュールに収録されている。その分類に基づいて、小さな節に分けて、解説する。

### TSVファイルの変換に関係するもの 
この節のコマンドはBin::TSV::Convにも収録されている。

- **csv2tsv** : CSV形式(ダブルクォート囲みの場合も対処)をTSV形式に変換。

- xlsx2tsv (▼▼) : ExcelファイルをTSV形式に変換

- mtranspose : 「行列の転置」(←数学用語)。TSV形式のテーブルに対して、行方向と列方向を反転する。

- csel : AWKよりも容易に列の操作ができるユーティリティ(指定した列群を、-pで表示、-dで抑制、-hで先頭に移動、-tで末尾に移動; -=で列名でこれらの操作を指定)

- join2 (▼): 2個のテーブル(TSVファイル)をjoinする。UnixのjoinおよびSQLのjoinと似た様な操作である。

### TSVファイルの便利な機能群 
この節のコマンドはBin::TSV::Utilにも収録されている。

- colgrep (▼◆): grep (文字列検索)を指定した列に対して行う。

- **colsummary** : ひとつのTSVファイルをテーブル(表)と見なして、全列のそれぞれに対して、(1)異なる出現値の数(2)平均値(3)出現値の範囲(最小と最大など)(4)頻出する値(上位数個)

- colchop (▼): lessでTSVファイルを閲覧しようにも、たとえば先頭行に出現する値が長すぎて、表として画面の表示が見にくい場合がある。その場合に、長すぎる値を指定した長さで折りたたむようにすることができる。

- colpairs (▼◆) : ある表の任意の2列の組合せについての、いろいろ有用な統計情報を抽出する。対比して、colsummaryは、各列単体ばらばらの情報しか出力しない。

- collen : 各列の、長さについての情報を抽出する。ある用途によっては頻繁に利用するかも知れない。

- keyvalues : 2列以上のデータに対して、先頭列(最も左側の列)をキーと見なし残りの列をバリューと見なして、全ての異なるキーの出現値に対して、何個の異なるバリュー値が出現したかを表す。同じキー値で異なるバリューが出現していないか検知するのに、便利。キーとバリューをどの列で切るかについても、オプションで指定可能。

- kvcmp : 2個のTSVファイルに対して、キーとバリューの関係(keyvaluesを参照せよ)が、等しいか否かを判定する。TSVファイルに格納された表は行の順番に意味が無いことがあるので、その場合に、2個のTSVファイルのそれぞれの表が同じ意味を持つか否かを判定するために用いる。

- *joinn* : 2個または3個以上のTSVファイルに対して、同じキーの値が異なるファイルにおいてどんなバリューの値になっているかを、行列状に出力する。



### 各行をそれぞれの文字列データと見なすコマンド群
この節のコマンドはBin::Data::1Dにも収録されている。

- **freq** : 各行の値の頻度表を出力。シェル芸の`sort | uniq -c`と似た機能であるが、出力表の各行の出力順序の指定、累積和の表示など、きめ細やかな小機能を搭載していて、オプションスイッチで自由自在に指定が可能。

- **expskip** : 1, 10, 100, 1000行目を表示。ただし、最初の2行と最後の2行も表示。指数関数的に行を読み飛ばすが、どのようにするかは、オプションで指定がいろいろ出来る。

- alluniq (◆) : 各行の出現値が全て異なるか、そうで無い場合は複数回出現した値はどのようなものがあったかを分かり安く表示する。(colsummaryより高速。)

- digitdemog (▼) : 何桁目にどんな文字が出現したかを表示。(また全然別の機能として、各行の文字列長ごとに、文字列の最小と最大の値を整理して出力。) **値の書式**を観察するのに有用。

- chars2code : 各行ごとに、各文字の文字符号を、行ごとに整理して出力する。いろいろなオプションあり。Unicodeの符号位置を出力する(「あ」→u+3042など)。(Unixのダンプリストを出力するような`od -tax1`よりは遥かに便利であろう。全角マイナス(−)なのか、長音記号(ー)なのかなどの区別がしやすい。)

- lminusl : 2個のファイルA,Bに対して `lminusl A B`により、Aに存在してBに存在しない行を出力する。(**差分**)

- venn : N個ファイルに対して、各行がどのファイルに現れたか(最大2^N-1通り、つまり、最大2ᴺ-1通り)のパターンを**ベン図**のような概念で分かり安く表示する。

### ターミナルの文字に着色するコマンド
この節のコマンドはBin::Text::Color::Plusにも収録されている。

- **colorplus** : 数値に3桁ごとに色を付けたり、表形式のデータを5列ごとに背景を青と黒で交代させて表示させることで、データの意味を読み取りやすくする。`colorplus -0`で着色を解除する(普通のテキストになる)。

- reisistorcc : <a href="https://ja.wikipedia.org/w/index.php?curid=4612#%E3%82%AB%E3%83%A9%E3%83%BC%E3%82%B3%E3%83%BC%E3%83%89">電気抵抗器のカラーコード</a>を参考にした着色を数値に対して行う。

- backcolor (▼) : 多数の数値のみの情報に対して、背景に6段階で違う濃さの青色で着色して、意味が分かりやすくする。

(上記3個のコマンドは、全て1個のコマンド**colorplus**に機能を統合することは検討中。)

### 乱数を出力するコマンド
この節のコマンドはBin::Gen::Randにも収録されている。

下記のコマンドにより、実験用のデータも生成が可能となる。

- **saikoro** : 1から6までの整数の乱数を出力。-g オプションでTSV形式の行列でも出力。たとえば`saikoro -g3,2`で3行2列の乱数行列になる。 -s でシードの固定も可能。

- boxmuller : <a href="https://ja.wikipedia.org/w/index.php?curid=2477902">ボックス＝ミュラー法</a>でガウス乱数を生成。


## 注意点・バグなど

1101. 「コマンド名の衝突」に由来する不具合は想定されうる(App::Bin4TSVのインストールにより他のコマンドが使えなくなる、およびApp::Bin4TSVのアンインストールにより他のモジュールがインストールしたはずの実行ファイルが消されてしまうなど)。

1101. 本ソフトウェアが提供する`csv2tsv`について、本文書の作成者が、ある10万行くらいの大きなCSVデータ(途中に改行文字の値など含む)の変換について、変換が途中でうまくいかなくて、結局、そのデータを2個に分けてTSVに変換することをしたことがある。Text::CSV_XSに由来するバグの可能性を考えているが、まだよくは調べていない。

# データ分析の実務等で使う場合の大きな流れ

- 本ソフトは、既存のUnixコマンドとそのシェル芸と組みあわせて使うことが想定されている。ただし、単体でもある程度使うことはできるであろう。
- 本ソフトは、OECD非加盟国の政府や、古いシステムを更新していない大企業のデータセキュリティルーム内でも使える様にすることを想定している。
(したがって5年ないし10年程度程度古いシステムで使えるように `use 5.014`の宣言が各プログラムでされている。)
-　(ここで記したような、大きな流れだけでなくて、派生的に発生するであろう小さな枝分かれ的な作業でも使える様に、既存のUnixコマンドにない
コマンドも本ソフトウェアの収録するようにしてある。)

(したがって5年ないし10年程度程度古いシステムで使えるように `use 5.014`の宣言が各プログラムでされている。)

##　想定されている流れ

表形式のデータが用意された場合に、下記の様なことを迅速に済ますことで、さらに本格的なデータ分析や機械学習などの高度な処理を容易にしたり、
最初にデータに不備がある場合にそれを迅速に把握することができるであろう。

1. データを受け取る
2. ファイル群がどのようにディレクトリに**配置**されているか理解する
3. **各データファイルの概要**を把握する。
    - `expskip`で各ファイルの最初から最後まで把握する。
    - `alluniq`で各レコードに重複がないか把握する。
    - `colsummary`で各列の様子を詳しく把握して、**表としての意味をよく理解する**。異常値や特別値もよく把握出来るであろう。(最初に重要なステップとなるであろう。)
    - `digitdemog`で各列の具体的な書式などをもっと把握出来るであろう。
    - `colpairs`で列間の関係を把握する。
    - 各データに不具合が無いか把握する。`crosstable`で重要な2列の組合せで**クロス表**を作成して、穴が無いか、などで把握出来る。
4. **データファイル間の関係**を把握する。
    - 複数のファイルの関係を`join2`や`joinn`、および、`csel`と`venn`を組みあわせて把握する。
5. 複数のログファイルに対して、特定のユーザーがどういう履歴を残したかを把握する。
    - ※ ただしこの目論見を実行するコマンドは未設計・未実装である。


現状、一般にデータ分析は、それぞれの処理が複雑になりがちで、どこで不具合かを発生させたのか再現性を確保するのも、非常に困難だと
思われるが、上記のコマンド、もしくは、そのようなコマンドの開発の延長上に、その困難さが解決できると期待できる。
たとえば、現状、ひとつのテーブル(表)に対する機械学習の様々な手法は開発され使われているもの、そのテーブルが2個になった途端急に
難しくなる。実際には、そのようなテーブルが何十も与えられたりしている。さらに言うと、多くの組織が保管するデータは、1つのテーブルでも
数十の列が含まれていることで、一体どれが重要で、どれがそうでないのか、把握していろいろな判断をするのが困難であると考えられる。

上記の様な流れ(1〜5)を手際よく実現する手段をうまく確立することで、世の中のいろいろなデータ処理やデータ分析の問題が解決するであろう。

## データ分析の流れについての更なる資料

このような流れについて、参考となる資料としては、次の2点が上げられる。
これらは、本ソフトウェアのUnixコマンド方式ではなくて、**SQLのデータベースにおけるデータプロファイリングの考え方**として、上記の考え方を表そうと、本文書の作成者が過去に試みたものである。
- <a href="https://www.slideshare.net/shimonotoshiyuki/make-accumulated-data-in-companies-eloquent-by-sql-statement-constructors-pdf">IEEE Big Data 2017での発表</a>
- <a href="https://www.slideshare.net/shimonotoshiyuki/sqlgen190412">SQL⽂⾃動⽣成器による 簡潔かつ洗練度の⾼い Data Profilingの試み</a>


# 今後の開発計画についてのメモ
## 分析上の課題

1201. コマンド群の提供する機能はまだ十分ではない。
101. 複数のログファイルで同一ユーザーがどういう履歴を残したか把握しやすい仕組みがない。

## 技術上の課題
1301. テストが作られたことが無い。
201. コマンド間で統一すべきことがまだ残っている。
201. いくつかのコマンドは一つに統合すべきである。
201. いくつかのコマンドは機能をバラすべきかも知れない。
201. 親切便利という観点で、提供したコマンドで差がある。
201. 計算中に使ったメモリの量を2次情報として出力していない。
203. 着色して標準エラー出力に出す2次的な情報が不十分な場合がある。
202. perl -T のようなtaint対策が可能なのに不十分なコマンドがある。
204. ヘルプの文章は日本語が主であり、世界で使われるためには英文の用意も必要。
205. --help で表示されるヘルプの文章と同じようには、manとperldocで動作しない。
206. Ctrl+Cで割り込みシグナルを送ると意味不明に見える動作をしうる(Ctrl+Zを使って対処)。
207. CPANおよびUnix/Linuxコマンドでコマンド名の衝突を防ぐ仕組みがない。CPANではモジュール名の衝突は起きない仕組みになっているが、コマンド名の衝突の起きにくいうまい仕組みを提案したい。

## 今後変更されうる現状の仕様
1401. サブコマンド方式はまだ採用していないこと。
301. 各コマンドの実体は独立単体で動くPerlプログラムであること。
301. 並列化は積極的にしていないこと。`fork`関数の使用は検討済み。
301. 共通化可能な部分はあるが、独自モジュールを使って`use`していないこと。
301. 標準モジュールのみ`use`していること。`List::MoreUtils`も使っていない。
301. XSインターフェースの未使用。`chomp; @F=split/\t/o,$_,-1; `の部分は高速化したい。
301. `Term::ReadKey`を使っていないこと。処理中にシグナル以外の方法でもキー押下の処理を付けたい。
301. `use 5.014`であること。srand関数から乱数シードを得るため。もっと古いシステムでも動作させたい。
301. 環境変数は使っていないこと。現状オプションスイッチ("-"で始まる)で各コマンドの動作(区切り文字の指定など)。
301. `use Getopt::Std`でのみオプションスイッチ処理を行っていること。`--help`もこれに依存。ギリシア文字θも`-θ`のように使いたい。`-e`を複数使える`grep`のようにしたい。


# 関連資料

## 関連するCPANモジュール

現状(2021年5月現在)、https://metacpan.org/author/TULAMILI にある、モジュール名 Bin::で始まるモジュール8個が関連するCPANモジュールである。


## 関連記事および講演

このモジュール(もしくはGitHubのこのレポジトリ)が提供するコマンド群、すなわち、本ソフトウェアは、下記で解説が講演や雑誌投稿の形で過去に行われた。

1. <a href="https://gihyo.jp/magazine/wdpress">Web+Press DB</a> 第124巻(翔泳社) 2021年8月号の<a href="https://gihyo.jp/dev/serial/01/perl-hackers-hub">Perl Hackers Hub</a> の連載 第68回目 
2. 映像情報メディア学会の<a href="https://www.ite.or.jp/content/journal/">学会誌</a>の2018年7月号《<a href="https://www.ite.or.jp/content/opendata/">私の研究開発ツール</a>》（第100回）Table::Hack 表形式データの前分析ソフトウェア
1. IEEE Big Data 2016 (2016年12月ワシントンDC)の<a href="http://cci.drexel.edu/bigdata/bigdata2016/Workshops.html">Workshop</a>(2nd International workshop on Methodologies to Improve Big Data Projects)での<a href="https://www.slideshare.net/shimonotoshiyuki/a-hacking-toolset-for-big-tabular-files-3">発表</a>
4. キヤノングローバル戦略研究所での経済物理学の<a href="https://cigs.canon/event/report/20161021_3981.html">研究集会</a>(2016年8月29日)での<a href="https://www.slideshare.net/shimonotoshiyuki/ss-65145461">発表</a>

# LICENSE

Same as Perl.
