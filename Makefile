# This Makefile is intended to create the website
# https://fricas.github.io/fricas-notebooks (which is the github-pages
# branch of the fricas-notebook repository at
# https://github.com/fricas.

MKDIR_P = mkdir -p

DEMOS = \
  FriCAS-FirstSteps \
  FriCAS-DataStructures \
  FriCAS-Infinite \
  FriCAS-Numbers \
  FriCAS-Types \
  FriCAS-LinearAlgebra \
  FriCAS-Solve \
  FriCAS-SkewPolynomial \
  FriCAS-TaylorSeries \
  FriCAS-LaurentPolynomial \
  system-command-set

.PRECIOUS: tmp/%.nbconvert.ipynb tmp/%.ipynb

tmp/%.input: %.input
	${MKDIR_P} tmp
	cp $< $@

tmp/%.ipynb: tmp/%.input
	cd tmp; jupytext --to ipynb --from input $*.input
# cd tmp; jupytext --to ipynb --from input --execute $*.input

# Note that jfricasx is a jfricas kernel with an additional sleep(1).
# jfricasx is a copied jfricas kernel were we use
#
#    pid = Popen(['gnome-terminal', '--title=jfricas', '--'] +
#                ['fricas','-nosman','-eval',prereq,'-eval',start])
#    import time
#    time.sleep(1)
#
# instead of
#
#   pid = Popen(['fricas','-eval',prereq,'-eval',start])
#
# in fricaskernel.py.

tmp/%.nbconvert.ipynb: tmp/%.ipynb
tmp/%.html: tmp/%.ipynb
	cd tmp; \
	  jupyter nbconvert \
	    --to ipynb \
	    --ExecutePreprocessor.kernel_name=jfricasx \
	    --execute \
	    --allow-errors \
	    --stdout \
	    $*.ipynb \
	| jupyter nbconvert --stdin --to html --stdout \
	> $*.html

tmp/index.html: index.html
	cp $< $@

html: ${patsubst %, tmp/%.html, ${DEMOS}} tmp/index.html

clean:
	-rm -rf tmp
