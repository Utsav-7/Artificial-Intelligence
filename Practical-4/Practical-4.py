import re
import nltk
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
from nltk.stem import PorterStemmer, WordNetLemmatizer
nltk.download('punkt')
nltk.download('stopwords')
nltk.download('wordnet')

# Sample text for demonstration
text = "The quick brown fox jumps over the lazy dog, exploring the lush green forest with curious eyes."

# Text Reading
print("Text Reading:")
print(text)

# Text Pre-processing
print("\nText Pre-processing:")
# Convert text to lowercase
text_lower = text.lower()
# Remove punctuation and special characters
text_clean = re.sub(r"[^\w\s]", "", text_lower)
# Tokenize text
tokens = word_tokenize(text_clean)
# Remove stopwords
stop_words = set(stopwords.words("english"))
filtered_tokens = [word for word in tokens if word not in stop_words]

# Text Analysis (Word Frequency)
print("\nText Analysis (Word Frequency):")
word_freq = nltk.FreqDist(filtered_tokens)
print(word_freq.most_common())

# Text Classification (Identify specific words)
print("\nText Classification (Identify specific words):")
# Define patterns for classification
patterns = {
    "nltk": r"\bnltk\b",
    "processing": r"\bprocessing\b"
}
# Classify text based on patterns
classified_text = {}
for category, pattern in patterns.items():
    classified_text[category] = re.findall(pattern, text_lower)
print(classified_text)

# Exploratory Data Analysis (EDA)
print("\nExploratory Data Analysis (EDA):")
# Sentence tokenization
sentences = nltk.sent_tokenize(text)
print("Number of sentences:", len(sentences))
# Average words per sentence
avg_words_per_sentence = sum(len(word_tokenize(sentence)) for sentence in sentences) / len(sentences)
print("Average words per sentence:", avg_words_per_sentence)

# Stemming
print("\nStemming:")
porter = PorterStemmer()
stemmed_words = [porter.stem(word) for word in filtered_tokens]
print(stemmed_words)

# Lemmatization
print("\nLemmatization:")
lemmatizer = WordNetLemmatizer()
lemmatized_words = [lemmatizer.lemmatize(word) for word in filtered_tokens]
print(lemmatized_words)
