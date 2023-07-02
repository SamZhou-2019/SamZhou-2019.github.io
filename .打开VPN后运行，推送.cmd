git config --global http.proxy http://127.0.0.1:58309
git config --global https.proxy http://127.0.0.1:58309
git add .
git commit -m "update"
git push
git config --global http.proxy http://github.com
git config --global https.proxy http://github.com