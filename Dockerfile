FROM centos
#★rbenvのインストール
RUN yum install -y git 
RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv
RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
#RUN ~/.rbenv/bin/rbenv init
#RUN source ~/.bash_profile
#★ruby-buildのインストール
RUN git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
RUN ~/.rbenv/plugins/ruby-build/install.sh
#★Rubyのインストール
RUN yum install -y openssl-devel readline-devel zlib-devel 
RUN yum remove bzip2
RUN yum install -y bzip2 gcc make
#RUN rbenv install 2.5.1
#RUN echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
#RUN source ~/.bash_profile
#RUN rbenv global 2.5.1
RUN source ~/.bash_profile \
    && rbenv install 2.5.1 \
    && echo 'eval "$(rbenv init -)"' >> ~/.bash_profile \
    && source ~/.bash_profile \
    && rbenv global 2.5.1

RUN localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG="ja_JP.UTF-8" \
    LANGUAGE="ja_JP:ja" \
    LC_ALL="ja_JP.UTF-8"

# Bundler
RUN bash -l -c 'gem update --system'
RUN bash -l -c 'gem install bundler --force'

# bundlerを実行しようとするとg++がないって怒られるので…
RUN yum -y install gcc-c++


CMD [ "/bin/bash --login", "run" ]