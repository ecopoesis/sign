TARGETS=$(shell ls *pdf | sed s/pdf/dxf/)

all: ${TARGETS}

%.dxf: %.pdf
	pstoedit -dt -f dxf:"-polyaslines -mm" $< $@
