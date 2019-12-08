#!/bin/bash
# git上でmdファイルを追加、編集、削除した場合に使用
# masterをpullし、buildを行い、htmlファイルを生成し、masterにpushする

# pullする前に現在のローカルのコミットハッシュを取得
local_commit=$(git rev-parse HEAD)

git pull

# レポジトリのルートディレクトリで
# ローカルコミットと最新のコミットに差分があるファイル名を取得
diff_md_files=$(git diff --name-only ${localCommit} HEAD --relative | grep ".md")
if [ ${#diff_md_files[*]} -ne 0 ]; then
    gitbook build ./ ./docs
    git add .
    git commit -m "$(echo "${diff_md_files[@]}")"
    git push
