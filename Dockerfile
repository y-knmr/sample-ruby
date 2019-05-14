FROM centos
#★rbenvのインストール
RUN yum install -y git 
RUN git clone https://github.com/rbenv/rbenv.git ~/.rbenv
RUN echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
#★ruby-buildのインストール
RUN git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
RUN ~/.rbenv/plugins/ruby-build/install.sh
#★Rubyのインストール
RUN yum install -y openssl-devel readline-devel zlib-devel 
RUN yum remove bzip2
RUN yum install -y bzip2 gcc make
RUN source ~/.bash_profile \
    && rbenv install 2.5.0 \
    && echo 'eval "$(rbenv init -)"' >> ~/.bash_profile \
    && source ~/.bash_profile \
    && rbenv global 2.5.0

#★ローカルPCからheloo.rbをコピー
COPY hello.rb /root/
CMD [ "/bin/bash --login", "run" ]