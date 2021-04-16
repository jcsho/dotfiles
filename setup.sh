#/bin/sh

# Install fonts for powerlevel10k
export FONT_DIR="$HOME/.local/share/fonts/MesloLGS NF" && (
  mkdir -p "$FONT_DIR"
  cd "$FONT_DIR"
  curl "https://raw.githubusercontent.com/romkatv/powerlevel10k-media/master/MesloLGS%20NF%20{Regular,Bold,Italic,Bold%20Italic}.ttf" -O
  prename -v 's/%20/ /g' *.ttf
  fc-cache -vf "$FONT_DIR"
)

# Setup programs from git
echo ' Installing powerlevel10k'
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

echo 'Installing Fzf...'
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --key-bindings --completion --no-update-rc --no-bash --no-fish

echo 'Installing Rust...'
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path

echo 'Installing Nvm...'
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"
nvm install --lts
# required for coc.nvim
npm install -g neovim

echo 'Installing vim-plug...'
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# install vim plugins
nvim --headless +PlugInstall +qall
# coc.nvim extensions
nvim --headless -c 'CocInstall coc-highlight coc-emmet coc-jedi coc-rust-analyzer' +qall
