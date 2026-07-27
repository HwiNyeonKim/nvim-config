# nvim-config

Neovim 설정. 플러그인은 [lazy.nvim](https://github.com/folke/lazy.nvim)이 첫 실행 시 자동으로 받는다.

## 요구사항

Neovim 0.11 이상. `vim.lsp.config` / `vim.lsp.enable` / `vim.lsp.completion`과 nvim-treesitter main 브랜치가 요구한다.

## 외부 의존성

mason을 쓰지 않으므로 LSP 서버·포매터·린터는 모두 시스템 바이너리다. **없어도 에러가 나지 않고 조용히 동작만 안 하니** 새 머신에서는 먼저 설치한다.

```sh
brew install neovim pyright lua-language-server ruff stylua jq fzf ripgrep
```

| 바이너리 | 쓰는 곳 |
|---|---|
| `pyright`, `lua-language-server` | LSP (`lua/plugins/lsp.lua`) |
| `ruff` | Python 포맷·린트 (conform, nvim-lint) |
| `stylua`, `jq` | Lua·JSON 포맷 (conform) |
| `fzf` (0.36+), `ripgrep` | fzf-lua 파일 검색·live grep |

패키지 매니저 밖:

- C 컴파일러 — treesitter 파서 컴파일 (macOS는 Xcode Command Line Tools)
- Node.js — copilot.vim
- Nerd Font — nvim-web-devicons 아이콘

## 설치 확인

```vim
:checkhealth vim.lsp    " LSP 서버가 붙었는지
:checkhealth            " 전체
:Lazy                   " 플러그인 상태
:TSUpdate               " treesitter 파서 갱신
```
