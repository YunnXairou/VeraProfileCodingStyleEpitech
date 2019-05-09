VeraProfileCodingStyleEpitech

```bash
cp -rp /usr/lib/vera++ ~/.vera++/

cp coding_style_epitech ~/.vera++/profiles/
cp coding_style_epitech.params ~/.vera++/profiles/

vera++ -p coding_style_epitech --parameters ~/.vera++/profiles/coding_style_epitech.params  src/* include/* tests/*
```

In docker
```bash
docker build . -t epitechcontent/epitest-docker:vera
docker run -it \
    --rm --volume="$(pwd):/home/epitest/project" \
    epitechcontent/epitest-docker:vera

$> vera src/* include/* tests/*
```