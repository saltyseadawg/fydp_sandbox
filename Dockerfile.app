FROM python:3.11-slim-bookworm

RUN apt-get update && apt-get -y install python3-pip ffmpeg git
WORKDIR /app

# COPY data/forvo_zh_好玩.mp3 data/forvo_zh_好玩.mp3
# COPY data/pronunciation_zh_嚎.mp3 data/pronunciation_zh_嚎.mp3
COPY data/tone_perfect data/tone_perfect 
COPY requirements/ requirements/
RUN pip3 install --no-cache-dir -r requirements/requirements.txt
COPY tonami/ tonami/
COPY heroku/ heroku/
COPY tonami_interface.py tonami_interface.py
COPY data/parsed/toneperfect_pitch_librosa_50-500-fminmax.json data/parsed/toneperfect_pitch_librosa_50-500-fminmax.json


CMD ["sh", "-c", "streamlit run tonami_interface.py"]
