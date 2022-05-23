shopt -s extglob

cd /home/i/srv/hugo-blog-output

rm -rf !(.git)

cd /home/i/srv/hugo-blog



hugo

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