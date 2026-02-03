# identify chunks
find . -type f -size +0c -name "*err" > ../none_remaining_err.txt
sed 's/err/out/g' ../none_remaining_err.txt | sort > ../none_remaining_out.txt
# create empty file
touch ../none_remaining_plink.txt
# extract plink filename
while IFS= read -r filename;
do
head -n109 $filename | tail -n1 | sed 's/  --out //g' >> ../none_remaining_plink.txt
done < ../none_remaining_out.txt
done < ../none_remaining_out.txt
