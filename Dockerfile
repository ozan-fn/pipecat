FROM python:3.12-slim

WORKDIR /app

RUN apt-get update && apt-get install -y ffmpeg && apt-get clean

RUN pip install uv

ENV UV_COMPILE_BYTECODE=1
ENV UV_LINK_MODE=copy

COPY ./bot.py bot.py
COPY ./pyproject.toml pyproject.toml

RUN uv sync --no-dev

CMD ["uv", "run", "bot.py", "--host", "0.0.0.0", "--port", "7860"]

