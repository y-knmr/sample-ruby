### command

* 前提
  - 動かしたいソースをsrc配下に入れる。

* イメージのビルド
  - sample-rubyディレクトリ配下に入って下記を実行
     ``` cmd
     $ docker build ./ -t sample-ruby
     ```
* 起動
  ``` cmd
   $  docker run -v ${pwd}/src:/opt/app-root/src -it sample-ruby /bin/bash
  ```

* 残作業
  - volumeのマウント