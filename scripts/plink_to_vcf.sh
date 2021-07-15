#!/bin/sh

cd /project2/nobrega/grace/genos/CMC/plink
for i in $(seq 1 21); do
	plink --recode vcf-iid --bfile chr${i}_rsids --out ../vcf/chr${i}_rsid
	cd ../vcf
	awk '{ if($0 !~ /^#/) print "chr"$0; else if(match($0,/(##contig=<ID=)(.*)/,m)) print m[1]"chr"m[2]; else print $0 }' chr${i}_rsid.vcf > chr${i}_rsid_chr.vcf
	mv chr${i}_rsid_chr.vcf chr${i}_rsid.vcf
	bgzip chr${i}_rsid.vcf
	tabix -p vcf chr${i}_rsid.vcf.gz
	cd ../plink
done
