
hugo

cd /home/i/srv/hugo-blog-output
git add .
git commit -m "automated upload"
git push

ssh -T root@xopun.com <<EOF
cd /srv/hugo-blog
git pull

exit

EOF