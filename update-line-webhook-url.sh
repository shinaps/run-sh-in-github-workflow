#!/bin/bash

# .env ファイルから環境変数を読み込む
if [ -f .env ]; then
    export $(grep 'LINE_CHANNEL_ACCESS_TOKEN' .env | sed 's/#.*//g' | xargs)
fi

# ユーザーにエンドポイントURLの入力を促す
echo "Enter the webhook endpoint URL:"
read endpoint

curl -X PUT \
-H "Authorization: Bearer $LINE_CHANNEL_ACCESS_TOKEN" \
-H "Content-Type:application/json" \
-d "{\"endpoint\":\"$endpoint\"}" \
https://api.line.me/v2/bot/channel/webhook/endpoint
