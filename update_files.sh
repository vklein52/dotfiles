set -e

for FILENAME in ".emacs" ".bash_aliases" ".gitconfig"; do
    cp "$HOME/$FILENAME" $FILENAME
done
