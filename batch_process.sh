path="./src"
directions=`ls ${path}`
mkdir "./dst"
for d in ${directions}
do
	mkdir "./dst/${d}"
	files=`ls ./src/${d}`
	for f in ${files}
	do
		name=${f:0:2}".gz"
		echo "./src/${d}/${f}, ./dst/${d}/${f}, ${name}"
		./release/DenseTrack ./src/${d}/${f} | gzip >  ./dst/${d}/${name}
	done
done

#./release/DenseTrack : exec file
