FriCAS Notebooks
================

This repository contains a collection of notebooks usable with the
[FriCAS] computer algebra system with the intention to demonstrate the
features of [FriCAS].

See
<https://fricas.github.io/fricas-notebooks>
for an HTML form of the (evaluated) notebooks.

The notebooks are created using the [jFriCAS] frontend.

You might be surprised that the original source code of these
notebooks is an ordinary [FriCAS] `.input` file rather than the usual
[Jupyter] notebook ending `.ipynb`.

In order use `.input` files, you must install [JupyText] and register
this file ending as a type in [JupyText].

~~~
pip3 install jupytext --upgrade
~~~

If you do not see the notebook icon on `.input` documents after a
fresh restart of your [Jupyter] server, install the contents manager
manually. Append the following line to your
`~/.jupyter/jupyter_notebook_config.py` file.

~~~
c.NotebookApp.contents_manager_class = "jupytext.TextFileContentsManager"
~~~

Generate such a Jupyter config file, if you don't have one yet, with

~~~
jupyter notebook --generate-config
~~~





[FriCAS]: https://fricas.github.io
[jFriCAS]: https://pypi.org/project/jfricas
[Jupyter]: https://jupyter.org
[JupyText]: https://jupytext.readthedocs.io "JupyText"
