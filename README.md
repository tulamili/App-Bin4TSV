# App::Bin4TSV

## 概要
表形式のテキストデータファイル、特にTSV形式のファイルを扱うためのコマンド群およびその為に発生する周辺的な操作を行うためのコマンド群である。TSVとはTab-Separated Valuesであり、<a href="https://datatracker.ietf.org/doc/html/rfc4180">RFC 4180</a>で定義されている。
<!--なお、このモジュールをインストールすると、同じ作者が作成した、他のCPANモジュール群をインスト
ールする。すなわち、10個程度のモジュール群を一つにまとめた、ラッパーになっている。インストー
ル自体は、1分程度で終わるであろう。-->
各コマンドは実体は1個のPerl言語で書かれた、大雑把に50行
〜300行程度のブログラムであり、現在、約65個のコマンドが収録されている。
<!--他の仕組みは、それらを実行可能とするために適当なディレクトリに格納したり、オンラインマニュアルを生成したり、アンインストール等に備えて、インストール情報を書き留めるためのものに過ぎない。-->
利用には、Unix、Linux、シェルの使い方の知識が必要である。Perl言語プログラミングの知識は必要としない。ただし、何か不具合があった場合にPerlの知識があることは役に立つであろう。また収録したプログラムの改良提案などはPerlの知識は必要である。

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
上記は、30秒程度以内で完了するであろう。<a href="https://metacpan.org/pod/App::Bin4TSV">App::Bin4TSV</a>はCPANモジュールである。

上記のインストールした後で、**アンインストール**する場合(このソフトウェアの利用を今後しない場合)には、下記を行う。
```
cpanm -U App::Bin4TSV
```
上記により、除去するファイルの一覧が表示される。yキーを押下すると、アンインストールが完了する。


# 各コマンドについて


# 注意点・バグなど

「コマンド名の衝突」に由来する不具合は想定されうる(App::Bin4TSVのインストールにより他のコマンドが使えなくなる、およびApp::Bin4TSVのアンインストールにより他のモジュールがインストールしたはずの実行ファイルが消されてしまうなど)。

# 今後の開発計画についてのメモ
## 分析上の課題

* コマンド群の提供する機能はまだ十分ではない。
* 複数のログファイルで同一ユーザーがどういう履歴を残したか把握しやすい仕組みがない。

## 技術上の課題
* テストが作られたことが無い。
* コマンド間で統一すべきことがまだ残っている。
* いくつかのコマンドは一つに統合すべきである。
* いくつかのコマンドは機能をバラすべきかも知れない。
* 親切便利という観点で、提供したコマンドで差がある。
* 計算中に使ったメモリの量を2次情報として出力していない。
* 着色して標準エラー出力に出す2次的な情報が不十分な場合がある。
* Ctrl+Cで割り込みシグナルを送ると意味不明に見える動作をしうる(Ctrl+Zを使って対処)。← キーボードの絵文字を買いたい
* ヘルプの文章は日本語が主であり、世界で使われるためには英文の用意も必要。
* --help で表示されるヘルプの文章と同じようには、manとperldocで動作しない。
* CPANおよびUnix/Linuxコマンドでコマンド名の衝突を防ぐ仕組みがない。CPANではモジュール名の衝突は起きない仕組みになっているが、コマンド名の衝突の起きにくいうまい仕組みを提案したい。

## 今後変更されうる現状の仕様
* サブコマンド方式はまだ採用していないこと。
* 各コマンドの実体は独立単体で動くPerlプログラムであること。
* 並列化は積極的にしていないこと。`fork`関数の使用は検討済み。
* 共通化可能な部分はあるが、独自モジュールを使って`use`していないこと。
* 標準モジュールのみ`use`していること。`List::MoreUtils`も使っていない。
* XSインターフェースの未使用。`chomp; @F=split/\t/o,$_,-1; `の部分は高速化したい。
* `Term::ReadKey`を使っていないこと。処理中にシグナル以外の方法でもキー押下の処理を付けたい。
* `use 5.014`であること。srand関数から乱数シードを得るため。もっと古いシステムでも動作させたい。
* 環境変数は使っていないこと。現状オプションスイッチ("-"で始まる)で各コマンドの動作(区切り文字の指定など)。
* `use Getopt::Std`でのみオプションスイッチ処理を行っていること。`--help`もこれに依存。ギリシア文字θも`-θ`のように使いたい。`-e`を複数使える`grep`のようにしたい。


# 関連資料

## 関連するCPANモジュール

現状(2021年5月現在)、https://metacpan.org/author/TULAMILI にある、モジュール名 Bin::で始まるモジュール8個が関連するCPANモジュールである。


## 関連記事および講演

このモジュール(もしくはGitHubのこのレポジトリ)が提供するコマンド群は、下記で解説が講演や雑誌投稿の形で過去に行われた。

1. <a href="https://gihyo.jp/magazine/wdpress">Web+Press DB</a> 第124巻(翔泳社) 2021年8月号の<a href="https://gihyo.jp/dev/serial/01/perl-hackers-hub">Perl Hackers Hub</a> の連載 第68回目 
2. 映像情報メディア学会の<a href="https://www.ite.or.jp/content/journal/">学会誌</a>の2018年7月号《<a href="https://www.ite.or.jp/content/opendata/">私の研究開発ツール</a>》（第100回）Table::Hack 表形式データの前分析ソフトウェア
1. IEEE Big Data 2016 (2016年12月ワシントンDC)の<a href="http://cci.drexel.edu/bigdata/bigdata2016/Workshops.html">Workshop</a>(2nd International workshop on Methodologies to Improve Big Data Projects)での<a href="https://www.slideshare.net/shimonotoshiyuki/a-hacking-toolset-for-big-tabular-files-3">発表</a>
4. キヤノングローバル戦略研究所での経済物理学の<a href="https://cigs.canon/event/report/20161021_3981.html">研究集会</a>(2016年8月29日)での<a href="https://www.slideshare.net/shimonotoshiyuki/ss-65145461">発表</a>
