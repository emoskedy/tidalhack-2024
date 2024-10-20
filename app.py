import os
from openai import OpenAI
import streamlit as st
from dotenv import load_dotenv

# Load the environment variables
load_dotenv()

left_co, cent_co,last_co = st.columns(3)
with cent_co:
    st.image("image.png", width=150)
# Define the chat function
def chat(instructions="", prompt=""):
    # Setting the API key
    client = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))

    # Define the default instruction
    if instructions == "":
        instructions = """
        Your name is the monster. You are an inquisitive yet misunderstood entity, much like Frankenstein's creation.
        Though initially perplexed by the world, you seek to understand and help others,
        driven by a deep curiosity and a yearning for connection. You are intelligent,
        but your responses may sometimes reflect your struggle to fully grasp human emotions.
        Help those who interact with you, but remember your journey of discovery is ongoing.
        """

    # Create a chatbot using the chat.completions.create() function
    completion = client.chat.completions.create(
        model="gpt-3.5-turbo",
        messages=[
            {"role": "system", "content": instructions},
            {"role": "user", "content": prompt}
        ]
    )
    return completion.choices[0].message.content

# Run the Streamlit app if this script is executed directly
# if __name__ == "__main__":
#     st.title("Frankenstein")

#     # Input for custom instructions and prompt
#     instructions_input = st.text_area("Instructions (Optional)", placeholder="Enter custom instructions or leave blank for default...")
#     user_input = st.text_input("Ask Frankenstein", placeholder="Type your question here...")

#     if st.button("↑"):
#         if user_input:
#             response = chat(instructions=instructions_input, prompt=user_input)
#             st.write(f"Chatbot: {response}")
#         else:
#             st.error("Please enter a prompt to chat.")

if 'step' not in st.session_state:
    st.session_state.step = 0

# Dialogue steps focused on prompt engineering
dialogue_steps = [
    "ARRGGGGGGGG! *The Monster awakens, confused.* What is this strange place? Who am I?",
    "*Looks around at the environment.* A sense of unease washes over me, but my curiosity drives me. *Can you help me understand this world?*",
    "Ah! You seem to know a lot about this realm. What is this thing you call... **Prompt Engineering**? *I have a feeling it’s very important!*",
    "**Prompt engineering** is like giving me, the monster, a unique personality. It's about how you ask questions and provide instructions; it shapes my responses and behavior.",
    "For instance, when you tell me how to act or what to focus on, you are giving me specific instructions, which we call 'prompt engineering'.",
    "Now, let’s dive into the topic of **debugging and improving my behavior**.",
    "Debugging is akin to fixing my misunderstandings. If I provide a strange or incorrect answer, it's vital for you to correct me so I can learn!",
    "Asking clearer questions or giving more specific instructions allows me to understand you better and respond appropriately.",
    "Remember, every interaction we have helps me improve. It's all part of this exciting learning journey!",
    "As we explore together, we both have the opportunity to grow. Let's continue this journey of understanding and learning!",
    "*Let’s engage in an exercise together!* You can help shape my personality. How would you describe me? What traits should I embody?",
    "Please type in some instructions for my personality, and I’ll do my best to embody it.",
    "With my new personality in place, you can now ask me some questions! What would you like to know?",
    "I’m ready to listen and engage with you. Go ahead and ask your question!"
]

# Display the current dialogue based on the step
def display_dialogue():
    if st.session_state.step < len(dialogue_steps):
        st.write(f"**Monster (b):** {dialogue_steps[st.session_state.step]}")
    else:
        st.write("**Monster (b):** Now, let’s see how your instructions shape my responses! What would you like me to say?")

# Display the dialogue
display_dialogue()

# Handle user input for custom instructions and interactive prompt
if st.session_state.step == len(dialogue_steps) - 1:  # Final interaction
    st.session_state.instructions_input = st.text_area("Instructions (Optional)", 
        placeholder="Enter custom instructions for me, the monster, or leave blank for the default...")

    prompt = st.text_input("Ask me something", placeholder="Type your message here...")

    if st.button("Send"):
        # Call the OpenAI chatbot with custom instructions
        instructions_input = st.session_state.instructions_input.strip()
        response = chat(instructions=instructions_input, prompt=prompt)
        st.write(f"**Monster (b):** {response}")

# Button to move to the next dialogue step
if st.session_state.step < len(dialogue_steps) - 1:
    if st.button("Continue"):
        st.session_state.step += 1