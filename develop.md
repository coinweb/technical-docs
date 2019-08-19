# Coinweb Technical Documentation

## Modify Documentation

This site is based on [Jekyll](https://jekyllrb.com/).

Please refer to [Jekyll's documentation](https://jekyllrb.com/docs/) to see how to add new posts or modify this site.


## Prerequisites 

This projects builds and runs with Ruby 2.6.3, but it is not mandatory for you to have Ruby installed because it can also be built and run with Docker.

## Building and Running

### Docker

- First build docker images of this project

`docker build -f deploy/docker/Dockerfile -t coinweb/technical-docs:latest .`

- Build solution

```.bash
docker run --rm -ti -p 4000:4000 -v $PWD:/usr/src/app coinweb/technical-docs:latest bundle exec jekyll build
```

- Run solution

```.bash
docker run --rm -ti -p 4000:4000 -v $PWD:/usr/src/app coinweb/technical-docs:latest
```

### Ruby 

- Building 

```.bash
bundle install
bundle exec jekyll build
```

- Running

```.bash
bundle install
bundle exec jekyll serve
```

### Browsing 

If you want to browse in your local machine go to `http://localhost:4000`



