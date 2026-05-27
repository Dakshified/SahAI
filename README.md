# Skillforge: AI-Powered Skill Development & Mock Interview Platform

An interactive web application to practice mock interviews, analyze vocal/grammar performance using AI models (Sentence Transformers, SpaCy, and Librosa), and solve aptitude challenges. The backend uses a Flask API, SQLite database, and Groq LLM API, while the frontend is a modern React application.

---

## 🛠️ Prerequisites

Ensure you have the following installed on your system:
- **Node.js** (v18+ recommended) and **npm**
- **Python** (3.10+ recommended)
- **FFmpeg** (required by `pydub` and `librosa` for audio conversions and voice feature extraction)
  - *Windows*: Download from [FFmpeg Build](https://ffmpeg.org/download.html) and add the `bin` directory to your system's PATH.
  - *macOS*: `brew install ffmpeg`
  - *Linux*: `sudo apt install ffmpeg`

---

## 📂 Project Architecture

- **`config-overrides.js`**: Rewires the React dev server to use the frontend code in [frontend/skillforge-frontend](file:///c:/Users/Sanskar/OneDrive/Desktop/Engineering/2end%20Year/Sem%203/EDI/Skillforge/frontend/skillforge-frontend) using dependencies defined in the root [package.json](file:///c:/Users/Sanskar/OneDrive/Desktop/Engineering/2end%20Year/Sem%203/EDI/Skillforge/package.json).
- **`backend/`**: Python Flask server that handles API endpoints, user authentication, sqlite operations, AI/NLP answer scoring, and vocal fluency metrics.
- **`frontend/skillforge-frontend/`**: Contains React components, pages, hooks, and static assets.

---

## 🚀 Step 1: Run the Backend Server

The backend requires python dependencies, a database initialization, and a seed file. Follow these steps:

1. Open a terminal and navigate to the `backend` directory:
   ```bash
   cd backend
   ```

2. Activate your virtual environment `venv` if you already have one configured:
   - **Windows (PowerShell)**:
     ```powershell
     .\venv\Scripts\Activate.ps1
     ```
   - **Windows (CMD)**:
     ```cmd
     .\venv\Scripts\activate.bat
     ```
   - **macOS/Linux**:
     ```bash
     source venv/bin/activate
     ```

   *(Optional) If you don't have a virtual environment yet, create it first using:*
   ```bash
   python -m venv venv
   ```

3. Install the required Python dependencies:
   ```bash
   pip install flask flask-cors flask-jwt-extended spacy librosa numpy pydub scikit-learn openai python-dotenv requests sentence-transformers
   ```

4. Download the necessary SpaCy English language model:
   ```bash
   python -m spacy download en_core_web_sm
   ```

5. Set up and seed the SQLite database:
   ```bash
   python setup_db.py
   python seed.py
   ```
   *Note: This creates and populates [skillforge.db](file:///c:/Users/Sanskar/OneDrive/Desktop/Engineering/2end%20Year/Sem%203/EDI/Skillforge/skillforge.db) in the root directory.*

6. Setup your `.env` file inside the `backend` folder:
   Create a file named `.env` inside `backend/` and insert your Groq API key:
   ```env
   GROQ_API_KEY=your_actual_groq_api_key_here
   ```

7. Start the backend Flask server:
   ```bash
   python app.py
   ```
   The backend will run on **`http://127.0.0.1:5000`**.

---

## 💻 Step 2: Run the Frontend App

Because this repository uses a custom webpack build override (`config-overrides.js`), you must install and run the React app **from the root directory** (not from the frontend folder).

1. Open a new terminal at the **root directory** of the project (`Skillforge/`).

2. Install the node packages:
   ```bash
   npm install
   ```

3. Run the development server:
   ```bash
   npm start
   ```

The application should automatically open in your default browser at **`http://localhost:3000`**.

---

## 🔒 Authentication & Test Login

To test the application quickly without registering, you can sign in with the pre-seeded account:
- **Email/ID**: `test@example.com`
- **Password**: `dummy`
