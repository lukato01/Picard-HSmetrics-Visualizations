or i in `find /sc/orga/work/lukato01/CAP_inspection_files/* -name "*.picard"`; 
do 
	cat $i | head -n8 | tail -n2 > $i.part1
done
