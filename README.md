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


# 関連資料

このモジュール(もしくはGitHubのこのレポジトリ)が提供するコマンド群は、下記で解説が講演や雑誌投稿の形で過去に行われた。

3. <a href="https://gihyo.jp/magazine/wdpress">Web+Press DB</a> 第124巻(翔泳社) 2021年8月号の<a href="https://gihyo.jp/dev/serial/01/perl-hackers-hub">Perl Hackers Hub</a> の連載 第68回目 
2. 映像情報メディア学会の<a href="https://www.ite.or.jp/content/journal/">学会誌</a>の2018年7月号《<a href="https://www.ite.or.jp/content/opendata/">私の研究開発ツール</a>》（第100回）Table::Hack 表形式データの前分析ソフトウェア
1. IEEE Big Data 2016 (2016年12月ワシントンDC)の<a href="http://cci.drexel.edu/bigdata/bigdata2016/Workshops.html">Workshop</a>(2nd International workshop on Methodologies to Improve Big Data Projects)での<a href="https://www.slideshare.net/shimonotoshiyuki/a-hacking-toolset-for-big-tabular-files-3">発表</a>
4. キヤノングローバル戦略研究所での経済物理学の<a href="https://cigs.canon/event/report/20161021_3981.html">研究集会</a>(2016年8月29日)での<a href="https://www.slideshare.net/shimonotoshiyuki/ss-65145461">発表</a>
