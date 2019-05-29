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

   * すでにsample_rubyイメージが存在する場合[2回目以降の起動]の起動コマンドは下記。
   ``` cmd
       $ docker run -v ${pwd}/src:/opt/app-root/src -it sample_ruby /bin/bash --login
   ```


* メモ
  - centos/rubyのイメージを使ったものの、文字コードの設定ができなかったので使うのをやめました。
    - rootのユーザの操作ができるようにすればたぶんいける
  - イチからごりごりやるやつ（今やっているパターン）は、bundle installができないことでしばらく悩んでいました。
  - Windows10 Homeの場合、Docker Toolboxを使うことになるが…
     - マウントしたい場合、なぜかC:\Users\xxxでないと見えない。（しかもWindows8でMSのいう通りにアカウントを作っていた場合、Users配下が日本語になってしまってどうにもならないので、MSのアカウントに連携しないAdministrator権限のユーザを作って、そこから無理やりリネーム + レジストリをいじってフォルダ名を変えた。）
     - しかも起動時に使う-vオプション、なぜかWindowsのパスだとうまいことハマってくれないので…（:が)あるとダメっぽい  
      ※未確認
      ``` cmd
          $ docker run -v $ /c/Users/xxx/sample-ruby/src:/opt/app-root/src -it --name sample_ruby sample_ruby /bin/bash --login
      ```

      PowerShellの場合は上記で記載するか、pwdを捻じ曲げる関数を作るか否か。  
      Git Bashの場合は、/c/Users/xxxになっていた気がするのでそのままいけるかもしれない。
