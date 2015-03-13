VIMI_DIR = ~/.vimc
VIMRC = .vimrc
VUNDLE_DIR = bundle/vundle
BACKUP_PREFIX = .vimi.bak
DOT_VIM = .vim

simple: echo_start symlinks
	@echo "\nVimc successfully installed."

full: echo_start vundle_install symlinks
	@echo "\nVimc successfully installed."

echo_start:
	@echo "Start installing Vimc...\n"

vundle_install: vundle
	-vim +BundleInstall +quitall

symlinks: backup
	@ln -s $(VIMI_DIR)/$(VIMRC) ~/$(VIMRC) && \
	ln -s $(VIMI_DIR)/$(DOT_VIM) ~/$(DOT_VIM) && \
	echo "\nCreate symlinks:\n~/$(VIMRC) -> $(VIMI_DIR)/$(VIMRC)\n~/$(DOT_VIM) -> $(VIMI_DIR)/$(DOT_VIM)\n"

backup: remove_prev_backup
	@test ! -e ~/$(DOT_VIM) || \
		(\
		mv ~/$(DOT_VIM) ~/$(DOT_VIM)$(BACKUP_PREFIX); \
		echo "Vimc makes backup of your current ~/$(DOT_VIM) directory to ~/$(DOT_VIM)$(BACKUP_PREFIX)" \
		)

	@test ! -e ~/.vimrc || \
		( \
		mv ~/$(VIMRC) ~/$(VIMRC)$(BACKUP_PREFIX); \
		echo "Vimc makes backup of your current ~/$(VIMRC) to ~/$(VIMRC)$(BACKUP_PREFIX)\n" \
		)

remove_prev_backup:
	@test ! -e ~/$(DOT_VIM)$(BACKUP_PREFIX) || \
	rm -fr ~/$(DOT_VIM)$(BACKUP_PREFIX)

	@test ! -e ~/$(VIMRC)$(BACKUP_PREFIX) || \
	rm -f ~/$(VIMRC)$(BACKUP_PREFIX)

vundle:
	@test ! -e $(VIMI_DIR)/$(DOT_VIM)/$(VUNDLE_DIR) || \
	rm -rf $(VIMI_DIR)/$(DOT_VIM)/$(VUNDLE_DIR)

	@echo "Clone Vundle from github.com..."
	@git clone git://github.com/gmarik/vundle.git $(VIMI_DIR)/$(DOT_VIM)/$(VUNDLE_DIR) > /dev/null
	@echo "Done.\n"
