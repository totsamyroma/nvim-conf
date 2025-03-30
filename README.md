# nvim

## Installation
### Using brew
```bash
brew install neovim
```

## Dependencies
### LSP support
#### Lua language server
```bash
brew install lua-language-server
```
#### Ruby language server
```bash
gem install solargraph
```
### Telescope fuzzy finder support
```bash
brew install ripgrep
```
### Custom nvim web devicons support
```bash
brew install --cask font-hack-nerd-font
```
## Confuguration
### Font
Open iTerm settings
```
iTerm > Preferences > Profiles > Text
```
#### Cursor
- [x] Box
- [x] Blincking cursor
#### Text rendering
- [x] Draw bold text in bold font
- [x] Blinking text
- [x] Italic text
Use thin strokes for anti-aliased text: Always
- [x] Use build-in Powerline glyphs
#### Unicode
- [x] Use Unicode version 9+ widths
#### Font
Hack Nerd Fonta Propo Italic 18
- [x] Anti-aliased

### ENV
#### ChatGPT support
```bash
export OPENAI_API_KEY=***
```
### nvim config
```bash
cd ~/.config/nvim
git clone git@github.com:totsamyroma/nvim.git
```

