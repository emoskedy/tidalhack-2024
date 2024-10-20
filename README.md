# Build-A-Monster

Welcome to **Build-A-Monster**, an educational and fun-filled video game that teaches you how to create and customize your very own chatbot! This project, built in Unity, takes players on a journey through various stages of chatbot creation, from designing the user interface to engineering prompts and integrating APIs. The final chatbot will be hosted on a **Streamlit** web app.

## 🎮 Game Overview

In **Build-A-Monster**, you play as a young scientist helping a confused monster understand the world while learning how to build chatbots. The game walks you through six interactive scenes, each corresponding to a critical part of chatbot development.

### Scenes and Learning Topics:
1. **Introduction**  
   *Learn about what a chatbot is and why it’s cool to build one!*

2. **Story - Natural Language Processing (NLP)**  
   *Explore how chatbots understand and respond to human language.*

3. **Interface - Body Puzzle (User Interface)**  
   *Assemble the chatbot's body (UI) by designing the front-end interface where users can interact.*

4. **Electric Core - API Puzzle (API Integration)**  
   *Power up the chatbot by connecting it to external services using APIs.*

5. **Prompt Engineering - Customize Personality**  
   *Define the chatbot's personality by giving it specific instructions. Learn how prompt engineering shapes a chatbot's responses.*

6. **Debugging - Input and Improve the Chatbot**  
   *Test the chatbot by asking questions and debugging its responses to improve behavior.*

## 💡 Educational Goals

This game is designed to teach the core concepts of chatbot creation:
- **Natural Language Processing (NLP)**: Understanding how chatbots interpret text input.
- **User Interface (UI)**: Designing interactive elements for user-friendly experiences.
- **API Integration**: Powering up the chatbot by connecting to external services.
- **Prompt Engineering**: Defining instructions for the chatbot to customize its behavior.
- **Debugging and Testing**: Iterating to improve the chatbot’s responses.

## 🚀 How It Works

The final chatbot is hosted on a **Streamlit** web app, where players can interact with their creation outside the game. Behind the scenes, **OpenAI's GPT-3.5** powers the chatbot's conversation, enabling it to learn and respond based on the player's input.

### Technologies Used:
- **Unity**: For creating the interactive, educational game environment.
- **Streamlit**: For hosting the final chatbot on the web.
- **OpenAI API**: For powering the chatbot’s natural language understanding and conversation capabilities.
- **Godot**: For managing creating the interactive, educational game, puzzles environment.
- **Python**: For handling the backend and chatbot logic.

## 🔧 Installation and Setup

### Prerequisites
- Godot 4.1+
- Python 3.9+
- Streamlit
- OpenAI API key

### Steps:
1. Clone this repository:
   ```bash
   git clone https://github.com/5urada/build-a-monster.git
   cd build-a-monster```
2. Activate your Python Virtual Enviroment
3. Install necessary packages:
    ```pip install openai streamlit python-dotenv```
4. Add your OpenAI API key in the .env file
    ```OPENAI_API_KEY=your-api-key-here```
5. Deploy streamlit:
    ```streamlit run app.py```
6. Import the game directory into Godot and run