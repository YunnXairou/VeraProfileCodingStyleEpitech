VeraProfileCodingStyleEpitech

cp -rp /usr/lib/vera++ ~/.vera++/

cp coding_style_epitech ~/.vera++/profiles/
cp coding_style_epitech.params ~/.vera++/profiles/

vera++ -p coding_style_epitech --parameters ~/.vera++/profiles/coding_style_epitech.params  src/* include/* tests/*
