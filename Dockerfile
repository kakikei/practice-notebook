# Python 3.14をベースイメージとして使用
FROM python:3.14-slim

# 作業ディレクトリを設定
WORKDIR /workspace

# システムパッケージの更新と必要なツールのインストール
RUN apt-get update && apt-get install -y \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# requirements.txtをコピーして依存関係をインストール
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Jupyterの設定ディレクトリを作成
RUN mkdir -p /root/.jupyter

# Jupyter Notebookの設定
RUN jupyter notebook --generate-config && \
    echo "c.NotebookApp.ip = '0.0.0.0'" >> /root/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.allow_root = True" >> /root/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.open_browser = False" >> /root/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.token = ''" >> /root/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.password = ''" >> /root/.jupyter/jupyter_notebook_config.py

# ポート8888を公開
EXPOSE 8888

# Jupyter Notebookを起動
CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--allow-root"]
