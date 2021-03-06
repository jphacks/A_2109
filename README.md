# みんなで作る読書wiki 「WikiApp」 

![](./top.png)
## 製品概要
### 背景(製品開発のきっかけ、課題等）
技術書や数学書などはエンジニアにとって読むべき本でありつつも、内容の難しさや読了するのにかかる時間の膨大さから積読となってしまうケースは多々あります。

私たちはこの問題を解決するために、内容が理解できずに躓いてしまうといったことを軽減できないかと考えこのプロダクトを作成しました。
### 製品説明（具体的な製品の説明）
技術書をメインとした知識や感想の共有により読書に対する敷居を下げることを目的としたアプリです。

同じ本を読んでいる読者同士で助け合い、難しい本をともに読破することを手助けするために読書に最適化された情報共有が行えます。
### 特長
#### 本をベースに情報(投稿)が整理されており、読書中に役立つ情報へピンポイントでアクセスできる。

### 解決出来ること
* 理解できずに躓いてしまうケースを減らし、時間が短縮されることによって勉強効率が上がる
* 本をベースに整理された情報のデータベース(wiki)が作成される

### 今後の展望
* 同人誌などのISBNがないものにも対応する
* AWSなどの実際に運用可能なサーバーへのデプロイ
* webページ版の開発
* Android版の開発

### 注力したこと（こだわり等）
* 近年のios開発で推奨されているSwiftUIを主に使用した
* サーバーの環境構築と起動を自動化したため、フロント側の開発でもすぐにサーバーの変更を適用できた
### サーバー側のリポジトリ
https://github.com/jphacks/A_2109_1

## 開発技術
* swiftUI
* python
* mysql
* shellscript
### 活用した技術
* docker
* make
* xcodegen
#### API・データ
* openBD

#### フレームワーク・ライブラリ・モジュール
* flask
* combine

#### デバイス
* Ubuntu20.04 (server)
* iPhone12 (client)
