for file in texmf/tex/*; do
	if [ -f $file ]; then 
		echo "\\def\\sgc@compileday{$(date +%F)}" >> $file;
	fi
done
