### about sanmple-ruby

* Windows上でrubyを動かすためのイメージです。
  - rubyコマンド、bundleコマンドが実行できます。

* 前提
   - centosのイメージが存在すること
      - centosのイメージがない場合は下記を実行しておく。
         ``` cmd
            $ docker pull centos
         ```
   - Windows10 Proの場合は、これらのファイルがC:\Temp配下に入れておく。
     - Windows10 Homeの場合、使っているツールも異なるが…なぜかC:\Users\xxxじゃないとダメ

* イメージのビルド
  - sample-rubyディレクトリ配下に入って下記を実行
     ``` cmd
     $ docker build -t sample_ruby .
     ```
* 起動
  ``` cmd
   $  docker run -v ${pwd}/src:/opt/app-root/src -it --name sample_ruby sample_ruby /bin/bash --login
  ```
   > src配下を起動時オプションでvolume指定する。


* メモ
  - centos/rubyのイメージを使ったものの、文字コードの設定ができなかったので使うのをやめました。
    - rootのユーザの操作ができるようにすればたぶんいける
  - イチからごりごりやるやつ（今やっているパターン）は、bundle installができないことでしばらく悩んでいました。