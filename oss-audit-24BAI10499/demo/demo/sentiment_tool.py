# Simple Open Source Sentiment Tool
# This demonstrates the power of Python's open ecosystem

def analyze_text(text):
    positive_words = ['open', 'free', 'community', 'growth', 'share']
    score = sum(1 for word in text.split() if word.lower() in positive_words)
    return f"Open Source Spirit Score: {score}/5"

if __name__ == "__main__":
    user_input = input("Enter your thoughts on Open Source: ")
    print(analyze_text(user_input))