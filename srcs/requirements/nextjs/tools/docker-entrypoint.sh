#!/bin/sh

if [ ! -f $REACT_PROJECT ]; then
	echo "Creating new project!"
	npx create-next-app $REACT_PROJECT --ts --tailwind --eslint --src-dir --app --use-npm --import-alias "@/*"
	chown -R www-data:www-data $REACT_PROJECT
fi

cd $REACT_PROJECT

npm install
npm run build

exec npx next dev -H 0.0.0.0
