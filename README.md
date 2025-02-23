# Elasticsearch with Kuromoji

A Docker-based Elasticsearch setup with Kuromoji (Japanese language) analysis plugin.

## Features

- Elasticsearch with Kuromoji plugin for Japanese text analysis
- Kibana for visualization and management
- Secure authentication
- Configurable memory settings
- Support for both official and custom images

## Requirements

- Docker Engine 24.0.0+
- Docker Compose v2.0.0+
- 4GB+ RAM

## Setup

1. Clone and setup:
```bash
git clone <repository-url>
cd <repository-name>
cp .env.example .env
```

2. Configure `.env` file:
```env
STACK_VERSION=8.12.0
ELASTIC_PASSWORD=your_password
MEM_LIMIT=4g
ES_PORT=9200
KIBANA_PORT=5601
```

3. Start services:

Using official image:
```bash
docker compose up -d
```

Using custom build that includes kuromoji:
```bash
docker compose build
docker compose up -d
```

4. Verify:
```bash
curl http://localhost:9200
curl http://localhost:5601
```

## Environment Variables

### Required
- `STACK_VERSION`: Elasticsearch/Kibana version
- `ELASTIC_PASSWORD`: Elasticsearch password
- `MEM_LIMIT`: Container memory limit

### Optional
- `BUILD_CUSTOM`: Set to "true" for custom build
- `ES_PORT`: Elasticsearch port (default: 9200)
- `KIBANA_PORT`: Kibana port (default: 5601)
- `JAVA_OPTS`: JVM options

## Health Check

```bash
curl -X GET "localhost:9200/_cluster/health?pretty" -u elastic:<your-password>
```

## License

[MIT License](LICENSE.txt)