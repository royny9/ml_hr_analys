# 1. Базовый образ с Python
FROM python:3.10-slim

# 2. Рабочая директория в контейнере
WORKDIR /app

# 3. Установка зависимостей
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# 4. Копируем проект 
COPY hr_analys.ipynb .
COPY df_ITs.csv .
COPY best_model/ ./best_model/

# 5. Порт для Jupyter
EXPOSE 8888


CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]
