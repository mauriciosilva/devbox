default['vim']['install_dir']                        = '/etc/vim'
default['vim']['config_file_name']                   = 'vimrc.local'
default['vim']['plugins']                            = [
  "git://github.com/scrooloose/nerdtree.git",
  "git://github.com/kien/ctrlp.vim.git",
  "git://github.com/altercation/vim-colors-solarized.git",
  "https://github.com/godlygeek/tabular.git",
  "https://github.com/jnwhiteh/vim-golang.git"
]


node.set['java']['jdk_version'] = '7'

