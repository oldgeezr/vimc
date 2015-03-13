VIMI_DIR = ~/.vimc
VIMRC = .vimrc
VUNDLE_DIR = bundle/vundle
SOLARIZED_DIR = bundle/vim-colors-solarized
BACKUP_PREFIX = .vimi.bak
DOT_VIM = .vim

simple: echostart symlinks
	@echo "\nVimc successfully installed."

full: echostart bundle_install symlinks
	@echo "\nVimc successfully installed."

echostart:
	@echo "Start installing Vimc...\n"

bundle_install: vundle
	-vim +BundleInstall +quitall

symlinks: backup
	@ln -s $(VIMI_DIR)/$(VIMRC) ~/$(VIMRC) && \
	ln -s $(VIMI_DIR)/$(DOT_VIM) ~/$(DOT_VIM) && \
	echo "Create symlinks:\n~/$(VIMRC) -> $(VIMI_DIR)/$(VIMRC)\n~/$(DOT_VIM) -> $(VIMI_DIR)/$(DOT_VIM)\n"

backup: remove-prev-backup
	@test ! -e ~/$(DOT_VIM) || \
		(\
		mv ~/$(DOT_VIM) ~/$(DOT_VIM)$(BACKUP_PREFIX); \
		echo "Vimi makes backup of your current ~/$(DOT_VIM) directory to ~/$(DOT_VIM)$(BACKUP_PREFIX)\n" \
		)

	@test ! -e ~/.vimrc || \
		( \
		mv ~/$(VIMRC) ~/$(VIMRC)$(BACKUP_PREFIX); \
		echo "Vimi makes backup of your current ~/$(VIMRC) to ~/$(VIMRC)$(BACKUP_PREFIX)\n" \
		)

remove-prev-backup:
	@test ! -e ~/$(DOT_VIM)$(BACKUP_PREFIX) || \
	rm -fr ~/$(DOT_VIM)$(BACKUP_PREFIX)

	@test ! -e ~/$(VIMRC)$(BACKUP_PREFIX) || \
	rm -f ~/$(VIMRC)$(BACKUP_PREFIX)

vundle: solarized
	@test ! -e $(VIMI_DIR)/$(DOT_VIM)/$(VUNDLE_DIR) || \
	rm -rf $(VIMI_DIR)/$(DOT_VIM)/$(VUNDLE_DIR)

	@echo "Clone Vundle from github.com..."
	@git clone git://github.com/gmarik/vundle.git $(VIMI_DIR)/$(DOT_VIM)/$(VUNDLE_DIR) > /dev/null
	@echo "Done.\n"

solarized:
	@test ! -e $(VIMI_DIR)/$(DOT_VIM)/$(SOLARIZED_DIR) || \
	rm -rf $(VIMI_DIR)/$(DOT_VIM)/$(SOLARIZED_DIR)

	@echo "Clone Solarized colors from github.com..."
	@git clone git://github.com/gmarik/vundle.git $(VIMI_DIR)/$(DOT_VIM)/$(SOLARIZED_DIR) > /dev/null
	@echo "Done.\n"
