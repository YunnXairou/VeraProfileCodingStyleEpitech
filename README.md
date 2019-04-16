VeraProfileCodingStyleEpitech

cp -rp /usr/lib/vera++ ~/.vera++/

cp coding_style_epitech ~/.vera++/profiles/
cp coding_style_epitech.params ~/.vera++/profiles/

vera++ -p mine --parameters ~/.vera++/profiles/mine.params  src/* include/* tests/*