# Python

Getting up and running in as few steps as possible...

````python
def Python():
    return "And now for something completely different"
````
![alt text](/img/monty-python.jpg)


## Agenda

1. What is Python?
2. What do I need to get started?
3. Dive in!


## What is Python?

Python is an interpreted, high-level, dynamically typed, general purpose language

Named after Monty Python's Flying Circus
![alt text](/img/monty-python.jpg)

Released in 1991 by Guido Van Rossum

Now managed by the non-profit Python Software Foundation

Python is open source and runs on Windows, Mac and Linux

Available for free from https://www.python.org


## Ingredients

1. Python Runtime (recommend 3.8+)
2. Text Editor or IDE 

AND/OR use Pip/Conda to install Jupyter

And that's it!


## Option 1 - Python

https://www.python.org

This provides the bare minimum you need to start writing Python

Use Pip to install all the libraries you need

````bash
pip install mylibrary
````


## Option 2 - Anaconda

https://www.anaconda.com/

![Anaconda](/img/anaconda.png)

Anaconda Distribution is a free and comes with a bundle of related software. 

````bash
    # Install additional libraries with 
    conda install mylibrary
````

### Anaconda continued...

Available in Python 3.7 or 2.7 (don't ask) and is designed to give a "headstart" for Data Science projects, including:

* Libraries like MatplotLib, NumPy and Pandas
* Jupyter
* Spyder and more

![anaconda features](/img/distro-01-1.png)


## Python Installed...
### What Next?

Jupyter is a great way to play with Python (as well as for analytics and demos!)

````bash
    # Run the following in CmdLine, PowerShell or Bash
    pip install jupyter
    mkdir notebooks
    cd notebooks
    jupyter notebook
````

Open up your browser to:
    http://localhost:8888
_(might be opened automatically)_


## Demos


### Basics
Variables, lists and basic syntax


### Control Flows
If, Else If (elif), For, While

Try...Except


### Functions and Classes
Like any good language!


## Libraries

External libraries are a **huge** part of the Python ecosystem

My libraries at time of writing:

````bash
    arrow==0.13.0
    astroid==2.1.0
    backcall==0.1.0
    binaryornot==0.4.4
    bleach==3.0.2
    certifi==2018.11.29
    chardet==3.0.4
    Click==7.0
    colorama==0.4.1
    cookiecutter==1.6.0
    cycler==0.10.0
    Cython==0.29.2
    decorator==4.3.0
    defusedxml==0.5.0
    entrypoints==0.2.3
    ezodf==0.3.2
    Flask==1.0.2
    future==0.17.1
    holidays==0.9.8
    idna==2.8
    inflection==0.3.1
    ipykernel==5.1.0
    ipython==7.2.0
    ipython-genutils==0.2.0
    ipywidgets==7.4.2
    isort==4.3.4
    itsdangerous==1.1.0
    jedi==0.13.1
    Jinja2==2.10
    jinja2-time==0.2.0
    joblib==0.13.0
    jsonschema==2.6.0
    jupyter==1.0.0
    jupyter-client==5.2.3
    jupyter-console==6.0.0
    jupyter-core==4.4.0
    jupyterlab==0.35.4
    jupyterlab-server==0.2.0
    kiwisolver==1.0.1
    lazy-object-proxy==1.3.1
    lml==0.0.9
    lunardate==0.2.0
    lxml==4.3.0
    MarkupSafe==1.1.0
    matplotlib==3.0.2
    mccabe==0.6.1
    mistune==0.8.4
    more-itertools==4.3.0
    nbconvert==5.4.0
    nbformat==4.4.0
    notebook==5.7.2
    numpy==1.15.4
    odfpy==1.3.5
    osquery==3.0.5
    pandas==0.23.4
    pandocfilters==1.4.2
    parso==0.3.1
    pickleshare==0.7.5
    pipenv==2018.11.26
    plotly==3.5.0
    poyo==0.4.2
    prometheus-client==0.4.2
    prompt-toolkit==2.0.7
    pyexcel-ezodf==0.3.4
    pyexcel-io==0.5.11
    pyexcel-ods==0.5.4
    pyexcel-ods3==0.5.3
    Pygments==2.3.0
    pylint==2.2.2
    pyodbc==4.0.25
    pyparsing==2.3.0
    pystan==2.18.0.0
    python-dateutil==2.7.5
    pytz==2018.7
    pywinpty==0.5.4
    pyzmq==17.1.2
    qtconsole==4.4.3
    Quandl==3.4.5
    requests==2.21.0
    retrying==1.3.3
    scikit-learn==0.20.1
    scipy==1.2.0
    scons==3.0.4
    seaborn==0.9.0
    Send2Trash==1.5.0
    six==1.11.0
    sklearn==0.0
    SQLAlchemy==1.2.17
    terminado==0.8.1
    testpath==0.4.2
    thrift==0.11.0
    tornado==5.1.1
    traitlets==4.3.2
    urllib3==1.24.1
    virtualenv==16.2.0
    virtualenv-clone==0.4.0
    virtualenvwrapper-win==1.2.5
    wcwidth==0.1.7
    webencodings==0.5.1
    Werkzeug==0.14.1
    whichcraft==0.5.2
    widgetsnbextension==3.4.2
    wrapt==1.10.11
````

### Demo - Using Libraries


## Dev Tools

* Python can be run from the command line
* Idle Python shell is pretty basic
* For best results...

### Visual Studio Code  
![vscode](/img/vscode.png)

### PyCharm
![pycharm](/img/pycharm.png)

### Spyder
![spyder](/img/spyder.png)


## Demo

### Interactive VS Code


## Demo - Flask

* Flask is a well known and widely used "microframework" web server
* It contains the barebones for creating a fully fledged web service including routing and RESTful request dispatching
* You bring the other components you need e.g. ORM/ODM
* http://flask.pocoo.org


## Demo - Flask

Also, this Presentation is running on a flask app (see the source code on GitHub)

        // Run from the command line:
        python app.py

Full disclosure, it's actually written in MarkDown and Reveal.js




## Myths


### Python is slow
* It is a high level language but can be compiled down to C using Cython, a superset of Python which also allows methods to be written directly in C
* Make up for "slow" performance (compare to low level languages like C++) with significant productivity gains


### Python is only for Data Science
* Python is a multi-purpose language and can be used in
* BUT Python saw significant growth in 2018 in Data Science and consistently features in the TIOBE top 10


### Python is only used for prototypes
* Python is a full programming language and has numerous uses. 
* Eve Online, for example, is built in Python with some C-optimisations for performance. 
* Netflix, Facebook, Apple and Microsoft have all adopted Python into their portfolio



## Resources

---
* Python official Site - https://www.python.org/
* Anaconda - https://www.anaconda.com/
* Talk Python to me weekly audio Podcast - https://talkpython.fm/
* Local Python Meetups - https://www.meetup.com/Exeter-Python/
* These Slides - https://github.com/SimonStride/Presentations
