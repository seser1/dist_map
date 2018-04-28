FROM ruby:2.3
#docker run -it ruby:2.3 /bin/bash

RUN set -x && \
  cd /usr/local \
  git clone git://github.com/seser1/dist_map.git \
  cd dist_map \
  bundle install \
  cd dist_node \
  ruby ./main.rb
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
