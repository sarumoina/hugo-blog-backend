
hugo

rm -r -f /home/i/srv/hugo-blog-output

cd /home/i/srv/hugo-blog-output
git add .
git commit -m "automated upload"
git push

cd /home/i/srv/hugo-blog
git add .
git commit -m "automated upload"
git push

ssh -T root@xopun.com <<EOF
cd /srv/hugo-blog
git pull

exit

EOF