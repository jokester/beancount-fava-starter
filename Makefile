PYTHON_BIN ?= python3

deps: venv/.deps_installed

venv/.deps_installed: venv requirements.txt
	venv/bin/pip install -r requirements.txt --editable local
	@echo "deps installed"
	@touch $@

upgrade-deps:
	venv/bin/pur -r requirements.txt

format:
	venv/bin/ruff format src

venv: venv/.venv_created

venv/.venv_created: Makefile
	$(PYTHON_BIN) -mvenv ./venv
	@touch $@

