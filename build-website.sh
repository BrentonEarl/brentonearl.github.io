#!/bin/sh

VERS="1.1"
DATE="2015-07-22"

# Leave the desired layout uncommented.
#LAYOUT=layout1      # Tables based layout.
LAYOUT=layout2     # CSS based layout.

ASCIIDOC_HTML="python /usr/bin/asciidoc.py --backend=xhtml11 --conf-file=${LAYOUT}.conf --attribute=badges --attribute=revision=$VERS  --attribute=date=$DATE"

$ASCIIDOC_HTML index.txt
$ASCIIDOC_HTML about.txt
$ASCIIDOC_HTML projects.txt
$ASCIIDOC_HTML contact.txt
$ASCIIDOC_HTML 404.txt
