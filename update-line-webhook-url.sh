#!/bin/bash

# ユーザーにエンドポイントURLの入力を促す
echo "Enter the webhook endpoint URL:"
read endpoint

gh workflow run update-line-webhook-url.yml -F url="$endpoint"

# ワークフローの実行結果を確認するためにブラウザを開く
SLEEP_SEC=5
echo "$SLEEP_SEC"秒後にブラウザでGitHub Actionsのページを開きます
sleep $SLEEP_SEC
open https://github.com/shinaps/run-sh-in-github-workflow/actions
