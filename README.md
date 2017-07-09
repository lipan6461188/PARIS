# PARIS Analysis Pipeline

#### Dependency:
* seq library(pysam)
* g++
* bedtools

#### Installation

```bash
make
python paris.py				# Run with c++ code(fast)
python paris-old.py		# Run with python code(slow)
```

#### Recommend Parameters

```bash
ANNOTATION=/Share/home/zhangqf8/lipan/paris/tanglei_test/annotation
DATA=/Share/home/zhangqf8/lipan/paris/Cell2017_data/SRR2814763/test_small_sample
OUT=$DATA

bsub -q Z-ZQF \
    ~/lipan/paris/Cell2017_data/SRR2814763/test_small_sample/paris_c++/paris-new.py \
    -i $DATA/Aligned.out.sam \
    -j $DATA/Chimeric.out.junction \
    -s $DATA/Chimeric.out.sam \
    -o $OUT/DG \
    --genomeFile $ANNOTATION/human-virus.fa \
    --intronAnnoFile ~/lipan/DYNAMIC/GTF/hg38.genomeCoor.bed \
    --tmpFileName 2017_7_7 \
    --log $OUT/log.2017_7_7.txt \
    --error $OUT/error.2017_7_7.txt \
    --removeRedundancy yes \
    --minOverhang 15 \
    --localAlign no \
    --preserveMultimap no \
    --intronFlanking 3 \
    --minOverlap 5 \
    --multipleDG no \
    --maxGap 10 \
    --maxDGOverhang 30 \
    --coverage pileup \
    --genomeSizeFile $ANNOTATION/genome.size \
    --minSupport 2 \
    --scoringMethod harmonic
```
--intronAnnoFile is a file produced using scripts/parseBedFromGTF.py

```
scripts/parseBedFromGTF.py -g GRCh38.gtf -o GRCh38 -s gencode
```
It produced GRCh38.genomeCoor.bed and GRCh38.transCoor.bed. Then use GRCh38.genomeCoor.bed as the parameter of --intronAnnoFile 


#### Example

```bash
samtools view -bh DG.sam | samtools sort > DG.bam
samtools index DG.sam
```
<img src="https://ws4.sinaimg.cn/large/006tNbRwly1fhc89cjzkdj31010rq77b.jpg">

#### Bug to Fix

1. PrintSopportSam sequence and quanlity format
