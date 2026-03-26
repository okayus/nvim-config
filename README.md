# Neovim Configuration

[LazyVim](https://github.com/LazyVim/LazyVim) ベースの Neovim 設定ファイルです。

## 含まれる設定

### カラースキーム
- [kanagawa.nvim](https://github.com/rebelot/kanagawa.nvim) (メインテーマ)

### LSP サーバー
- **TypeScript / JavaScript** — `ts_ls` (typescript-language-server)
- **Rust** — `rust_analyzer`
- **Haskell** — `hls` (haskell-language-server)
- **C / C++** — `clangd`

### フォーマッター / リンター
- `prettierd` — JavaScript / TypeScript フォーマッター
- `eslint_d` — JavaScript / TypeScript リンター

### 主要プラグイン
- [oil.nvim](https://github.com/stevearc/oil.nvim) — ファイルブラウザ (neo-tree の代替)
- [blink.cmp](https://github.com/saghen/blink.cmp) — 補完エンジン
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) — シンタックスハイライト
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) — Git 連携
- [flash.nvim](https://github.com/folke/flash.nvim) — モーション
- [trouble.nvim](https://github.com/folke/trouble.nvim) — 診断表示
- [which-key.nvim](https://github.com/folke/which-key.nvim) — キーバインドヘルパー

### Treesitter パーサー
`javascript`, `typescript`, `tsx`, `rust`, `haskell`, `c`

### エディタ設定
- 行番号: 絶対 + 相対
- タブ幅: 2スペース
- 折り返し: 無効

## Ubuntu へのセットアップ手順

### 1. 前提パッケージのインストール

```bash
sudo apt update
sudo apt install -y git curl build-essential unzip ripgrep fd-find
```

### 2. Neovim のインストール

最新の安定版をインストールします (v0.10 以上が必要):

```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
rm nvim-linux-x86_64.tar.gz
```

PATH に追加 (`~/.bashrc` に追記):

```bash
echo 'export PATH="/opt/nvim-linux-x86_64/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

動作確認:

```bash
nvim --version
```

### 3. この設定のクローン

```bash
# 既存の設定があればバックアップ
mv ~/.config/nvim{,.bak} 2>/dev/null
mv ~/.local/share/nvim{,.bak} 2>/dev/null
mv ~/.local/state/nvim{,.bak} 2>/dev/null
mv ~/.cache/nvim{,.bak} 2>/dev/null

# クローン
git clone https://github.com/okayus/nvim-config.git ~/.config/nvim
```

### 4. Neovim を起動

```bash
nvim
```

初回起動時に以下が自動実行されます:
- **lazy.nvim** がプラグインを自動インストール
- **Mason** が LSP サーバー・フォーマッター・リンターを自動インストール
- **Treesitter** がパーサーを自動インストール

初回は数分かかることがあります。インストール完了後、Neovim を再起動してください。

### 5. 言語ツールチェインの準備 (必要に応じて)

LSP が動作するには対応する言語のツールチェインが必要です:

```bash
# Node.js (TypeScript / JavaScript 用) — nvm 経由推奨
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
source ~/.bashrc
nvm install --lts

# Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.bashrc

# C / C++ (clangd)
sudo apt install -y clangd

# Haskell (GHCup 経由)
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```

## ライセンス

Apache License 2.0 — 詳細は [LICENSE](LICENSE) を参照。
