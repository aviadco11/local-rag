import requests
import json

def ask_qwen(prompt):
    url = "http://127.0.0.1:11434/api/generate"
    
    # Data payload for the model you pulled (qwen3.5:0.8b)
    payload = {
        "model": "qwen3.5:0.8b",
        "prompt": prompt,
        "stream": False  # Set to False to get the full answer at once
    }

    try:
        print(f"--- Sending Prompt: {prompt} ---")
        response = requests.post(url, json=payload)
        
        # Check if the request was successful
        response.raise_for_status()
        
        # Parse and print the result
        result = response.json()
        print("\nResponse from Qwen:")
        print(result.get("response"))
        
    except requests.exceptions.RequestException as e:
        print(f"❌ Error connecting to Ollama: {e}")

if __name__ == "__main__":
    user_input = "describe me in one sentence about Israel? "
    ask_qwen(user_input)
    