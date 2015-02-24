
# this makefile is just for automate some simple tasks, like doc gen, etc.
# It is not necessary for the whole project, the only thing you need is
# just a perl script.

BASENAME = benchmark-blender
HELPNAME = documentation
LATEX = rubber
PLAINLATEX = latex
CLEANLIST = {tex,log,idx,dvi,aux,pdf,html}

# another option for using latex is just use normal latex:
#LATEX = latex

all: latex html text

latex:
	perldoc -oLaTeX ${BASENAME}.pl > ${HELPNAME}.tex
	${LATEX} --pdf ${HELPNAME}.tex
	${LATEX} --pdf ${HELPNAME}.tex
	${LATEX} --clean ${HELPNAME}

plain-latex:
	perldoc -oLaTeX ${BASENAME}.pl > ${HELPNAME}.tex
	${PLAINLATEX} ${HELPNAME}.tex
	${PLAINLATEX} ${HELPNAME}.tex
	dvipdf ${HELPNAME}.dvi ${HELPNAME}.pdf

html:
	perldoc -ohtml ${BASENAME}.pl > ${HELPNAME}.html

text:
	perldoc -otext ${BASENAME}.pl > ${HELPNAME}.txt

clean:
	rm -f ${HELPNAME}.tex
	rm -f ${HELPNAME}.log
	rm -f ${HELPNAME}.idx
	rm -f ${HELPNAME}.aux

mrproper: clean
	rm -f ${HELPNAME}.*
