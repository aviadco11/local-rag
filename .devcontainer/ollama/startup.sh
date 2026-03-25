#!/bin/bash

# 1. Set the host
export OLLAMA_HOST=0.0.0.0:11434

# Skip TLS verification (corporate proxy re-signs certificates)
export OLLAMA_INSECURE=true

# 2. Start Ollama with nohup to protect it from the script exiting
echo "Starting Ollama server..."
nohup ollama serve > /dev/null 2>&1 &

OLLAMA_PID=$!
echo "Ollama server started with PID: $OLLAMA_PID"

# 3. Wait for the server to be ready
until curl -s http://127.0.0.1:11434/api/tags > /dev/null; do
  echo "Waiting for Ollama server..."
  sleep 2
done

# 4. Pull the model
ollama pull qwen3.5:0.8b

echo "✅ Ollama is ready!"

# 5. CRITICAL: Keep the process attached if the container tries to close
# This 'wait' command tells the script to stay open as long as Ollama is running
wait $OLLAMA_PID

