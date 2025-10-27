# Practice Notebook - Docker Jupyter環境

Dockerを使用したJupyter Notebook環境です。データ分析や機械学習の練習に使用できます。

## 環境構成

- Python 3.14
- Jupyter Notebook / JupyterLab
- データ分析ライブラリ（NumPy, Pandas, Matplotlib, Seabornなど）
- 機械学習ライブラリ（scikit-learn）

## セットアップ

### 1. 必要なディレクトリを作成

```bash
mkdir -p notebooks data
```

### 2. Dockerイメージをビルド

```bash
docker compose build
```

### 3. コンテナを起動

```bash
docker compose up -d
```

## 使い方

### Jupyter Notebookへのアクセス

ブラウザで以下のURLにアクセスしてください：

```
http://localhost:8888
```

### コンテナの停止

```bash
docker compose down
```

### コンテナの再起動

```bash
docker compose restart
```

### ログの確認

```bash
docker compose logs -f
```

## ディレクトリ構成

```
.
├── Dockerfile              # Dockerイメージの設定
├── docker-compose.yml      # Docker Composeの設定
├── requirements.txt        # Pythonパッケージの依存関係
├── notebooks/              # Jupyter Notebookファイルの保存場所
└── data/                   # データファイルの保存場所
```

## インストール済みパッケージ

- **Jupyter**: Jupyter Notebook, JupyterLab
- **データ分析**: NumPy, Pandas, SciPy
- **可視化**: Matplotlib, Seaborn, Plotly
- **機械学習**: scikit-learn
- **その他**: ipywidgets, tqdm, requests

## パッケージの追加

追加のPythonパッケージが必要な場合：

1. `requirements.txt`にパッケージを追加
2. イメージを再ビルド：`docker compose build`
3. コンテナを再起動：`docker compose up -d`

または、実行中のコンテナ内でインストール：

```bash
docker compose exec jupyter pip install <package-name>
```

## トラブルシューティング

### ポートが既に使用されている場合

`docker-compose.yml`の`ports`セクションを変更してください：

```yaml
ports:
  - "8889:8888"  # 8889など別のポートに変更
```

### コンテナが起動しない場合

ログを確認してください：

```bash
docker compose logs
```
