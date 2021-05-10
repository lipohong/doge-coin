# build
npm run build

git add .
set /p commitMessage= "Enter your commit message: " 
git commit -m "%commitMessage%"
git push origin master

# navigate into the build output directory
cd ../docs

git init
git add -A
git commit -m 'Update and deploy'

git push -f git@github.com:lipohong/doge-coin.git master:gh-pages

# back to previous directory
cd -