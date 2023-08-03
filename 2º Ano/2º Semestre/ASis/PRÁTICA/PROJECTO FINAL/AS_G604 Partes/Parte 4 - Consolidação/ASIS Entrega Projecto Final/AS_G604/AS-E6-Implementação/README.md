## on git clone or git pull
run npm install for good measure

## run server
node server.js

## cloning heroku repository
heroku login\
heroku git:clone -a warm-savannah-50992

## deploying - copy your local changes into the repo

git add .\
git commit -m "comment"\
git push https://git.heroku.com/warm-savannah-50992.git
