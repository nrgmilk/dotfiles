mkdir -p $HOME/.vim/vim-ref/cache
cd /tmp
curl http://jp2.php.net/distributions/manual/php_manual_ja.tar.gz -o php_manual_ja.tar.gz
tar -zxvf php_manual_ja.tar.gz -C $HOME/.vim/vim-ref
