#!/bin/sh

#https://help.github.com/articles/changing-author-info/

cd /tmp/

while read p; do
    echo $p

    git clone --bare https://github.com/jakdemir/$p.git
    cd $p.git

    git filter-branch --env-filter '
    OLD_EMAIL="jak@tumblr.com"
    CORRECT_NAME="Jak Akdemir"
    CORRECT_EMAIL="jakdemir@gmail.com"
    if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
    then
        export GIT_COMMITTER_NAME="$CORRECT_NAME"
        export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
    fi
    if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
    then
        export GIT_AUTHOR_NAME="$CORRECT_NAME"
        export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
    fi
    ' --tag-name-filter cat -- --branches --tags
    git push --force --tags origin 'refs/heads/*'
    curl -u '${GITHUB_USER}:${GITHUB_TOKEN}' https://api.github.com/user/repos -d '{"name":"'$p'"}'
    git push --force --tags origin 'refs/heads/*'   
    cd ../
    rm -Rfv $p.git
done < ~/Desktop/repos.txt

