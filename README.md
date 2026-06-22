# 🤖 InnovaChat Frontend

InnovaChat is a modern AI-powered chatbot frontend built with **Flutter**, designed for seamless document-based conversations using **RAG (Retrieval-Augmented Generation)**.

This application allows users to upload documents, build a knowledge base, and chat with their files using an intelligent AI assistant powered by a FastAPI backend.

---

## ✨ Features

- 🔐 **Authentication System**
    - Secure login/signup
    - Google & Microsoft social login support

- 📂 **Document Upload (RAG)**
    - Upload files to create a custom knowledge base
    - Supported formats:
        - PDF
        - DOCX
        - TXT
        - Markdown (MD)

- 🧠 **RAG-Based Chat**
    - Ask questions directly from uploaded documents
    - Context-aware AI responses
    - Grounded answers based on file content

- 💬 **Chat Management**
    - Start new chat sessions
    - Manage uploaded files
    - Delete chat history

- 📱 **Modern UI/UX**
    - Minimal clean interface
    - Smooth chat experience
    - Responsive Flutter layout

---

## 📱 UI Overview

### 1. Login Screen
- User authentication
- Email/password login
- Social authentication

### 2. Landing Page
- Upload documents for RAG processing
- View uploaded documents
- Manage files

### 3. Chat Screen
- Chat with AI based on uploaded documents
- Create new conversations
- Add more files dynamically
- Delete chat session

---

## 🏗️ Architecture

Frontend and backend communicate through REST APIs.

```text
Flutter Frontend
       ↓
   FastAPI Backend
       ↓
Document Processing
       ↓
Embeddings Generation
       ↓
Vector Database
       ↓
LLM Response Generation
```

---

## 🛠 Tech Stack

### Frontend
- Flutter
- Provider / GetX (State Management)
- Dio / HTTP
- File Picker
- Secure Storage

### Backend
- FastAPI
- LangChain
- Sentence Transformers
- Vector Database (FAISS / Chroma)
- OpenAI / LLM APIs

---

## 📂 Project Structure

```text
lib/
├── core/
│   ├── constants/
│   ├── theme/
│   ├── utils/
│
├── models/
│   ├── auth_model.dart
│   ├── file_model.dart
│   ├── chat_model.dart
│
├── services/
│   ├── api_service.dart
│   ├── auth_service.dart
│   ├── chat_service.dart
│   ├── file_service.dart
│
├── providers/
│   ├── auth_provider.dart
│   ├── chat_provider.dart
│   ├── file_provider.dart
│
├── views/
│   ├── auth/
│   ├── home/
│   ├── chat/
│
├── widgets/
│   ├── custom_button.dart
│   ├── chat_bubble.dart
│   ├── upload_card.dart
│
└── main.dart
```

---

## 🚀 Getting Started

### Prerequisites

Make sure you have installed:

- Flutter SDK
- Dart SDK
- Android Studio / VS Code
- Running FastAPI backend

---

### Installation

Clone the repository:

```bash
git clone https://github.com/yourusername/chat_bot_frontend.git
```

Go to project directory:

```bash
cd chat_bot_frontend
```

Install dependencies:

```bash
flutter pub get
```

Run the app:

```bash
flutter run
```

---

## 🔗 Backend Setup

Make sure your FastAPI backend is running and update the API base URL inside:

```dart
lib/constants/app_urls.dart
```

Example:

```dart
const String baseUrl = "http://127.0.0.1:8000/api/v1";
```

For physical devices:

```dart
const String baseUrl = "http://YOUR_LOCAL_IP:8000/api/v1";
```

---

## 📄 Supported File Types

| Format | Supported |
|--------|----------|
| PDF    | ✅ |
| DOCX   | ✅ |
| TXT    | ✅ |
| MD     | ✅ |

---

## 🎨 Design System

### Colors
- Primary Purple: `#6366F1`
- Secondary Blue: `#38BDF8`
- Success Green: `#10B981`
- Dark Navy: `#0F172A`
- Light Gray: `#F1F5F9`

### Typography
- Poppins
    - SemiBold
    - Medium
    - Regular

---

## 🔮 Future Improvements

- Voice chat support
- Multi-chat history
- File summarization
- Export chat
- Multi-model support
- Team collaboration

---

## 📜 License

This project is licensed under the MIT License.

---

## 👨‍💻 Developer

Built with Flutter + FastAPI for intelligent document conversations.