### command

* 前提
  - centosがpullされていること

* イメージのビルド
  - sample-rubyディレクトリ配下に入って下記を実行
     ``` cmd
     $ docker build ./ -t sample-ruby
     ```
* 起動
  ``` cmd
   $ docker run -it sample-ruby /bin/bash --login
  ```

* 残作業
  - volumeのマウント