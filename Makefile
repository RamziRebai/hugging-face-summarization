install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt
test:
	python -m pytest -vvv --cov=App_Cover --cov=greeting \
		--cov=smath --cov=web tests
	python -m pytest --nbval notebook.ipynb #test our jupyter notebook
	python -m pytest -v tests/test_web.py #to test web
debug:
	python -m pytest -vv --pdb
one-test:
	python -m pytest -vv tests/test_greeting.py::test_my_name
format:
	black *.py
lint:
	pylint --disable=R,C *.py
all: install lint test format