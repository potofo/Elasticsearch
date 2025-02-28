# Kuromoji搭載Elasticsearch

日本語形態素解析プラグイン（Kuromoji）を搭載したDockerベースのElasticsearch環境です。

## 主な機能

- 日本語テキスト分析のためのKuromojiプラグイン搭載
- データの可視化と管理のためのKibana連携
- セキュアな認証機能
- メモリ設定のカスタマイズ機能
- 公式イメージとカスタムイメージの両対応

## 動作要件

- Docker Engine 24.0.0以上
- Docker Compose v2.0.0以上
- 4GB以上のRAM

## セットアップ手順

1. リポジトリのクローンと初期設定：
```bash
git clone <repository-url>
cd <repository-name>
```

2. 環境変数の設定（.envファイル）：
```env
STACK_VERSION=8.17.0
ELASTIC_PASSWORD=your_password
MEM_LIMIT=1073741824
ES_PORT=9200
KIBANA_PORT=5601
```

3. サービスの起動：

カスタム済みのイメージを使用する場合（推奨）：
```bash
docker compose up -d
```

公式イメージを使用する場合（推奨）：
```bash
docker compose -f docker-compose.build.yml up -d
```

kuromojiを含むカスタムビルドを使用する場合：
```bash
docker compose -f docker-compose.build.yml build
docker compose -f docker-compose.build.yml up -d
```

4. 動作確認：
```bash
curl http://localhost:9200
curl http://localhost:5601
```

## 環境変数の説明

### 必須項目
- `STACK_VERSION`: ElasticsearchとKibanaのバージョン
- `ELASTIC_PASSWORD`: Elasticsearchの管理者パスワード
- `MEM_LIMIT`: コンテナのメモリ制限

### オプション項目
- `BUILD_CUSTOM`: カスタムビルドを使用する場合は"true"を設定
- `ES_PORT`: Elasticsearchのポート番号（デフォルト: 9200）
- `KIBANA_PORT`: Kibanaのポート番号（デフォルト: 5601）
- `JAVA_OPTS`: JVMオプションの設定

## ヘルスチェック

以下のコマンドでクラスターの状態を確認できます：
```bash
curl -X GET "localhost:9200/_cluster/health?pretty" -u elastic:<your-password>
```

## ライセンス

[MITライセンス](LICENSE.txt)