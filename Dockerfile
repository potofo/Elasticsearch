# Base image for Elasticsearch with version 8.17.0
# This image includes the core Elasticsearch functionality
FROM docker.elastic.co/elasticsearch/elasticsearch:8.17.0

# Install additional analysis plugins for enhanced text processing

# Kuromoji Analysis Plugin
# - Provides Japanese language analysis
# - Includes tokenization, part-of-speech tagging, and reading analysis
# - Essential for proper Japanese text search and indexing
RUN elasticsearch-plugin install analysis-kuromoji

# ICU Analysis Plugin
# - Adds Unicode text folding and normalization
# - Provides language-specific text analysis
# - Supports multiple languages and character sets
# - Improves international text search capabilities
RUN elasticsearch-plugin install analysis-icu

# Note: Commented lines below show how to remove plugins if needed
# # Remove existing plugins if necessary
# RUN elasticsearch-plugin remove analysis-kuromoji
# RUN elasticsearch-plugin remove analysis-icu