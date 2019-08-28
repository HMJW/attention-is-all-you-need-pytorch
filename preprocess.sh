# sed -i "s/$RealBin\/..\/share\/nonbreaking_prefixes//" scripts/tokenizer.perl
# for l in en de; do for f in /data/wjiang/data/NMT/multi30k/*.$l; do if [[ "$f" != *"test"* ]]; then sed -i "$ d" $f; fi;  done; done
for l in en de; do for f in /data/wjiang/data/NMT/multi30k/*.$l; do perl scripts/tokenizer.perl -a -no-escape -l $l -q  < $f > $f.atok; done; done
python preprocess.py -train_src /data/wjiang/data/NMT/multi30k/train.en.atok -train_tgt /data/wjiang/data/NMT/multi30k/train.de.atok -valid_src /data/wjiang/data/NMT/multi30k/val.en.atok -valid_tgt /data/wjiang/data/NMT/multi30k/val.de.atok -save_data /data/wjiang/data/NMT/multi30k.atok.low.pt