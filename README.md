VeraProfileCodingStyleEpitech

```bash
cp -rp /usr/lib/vera++ ~/.vera++/

cp -r rules ~/.vera++/scripts/
cp coding_style_epitech ~/.vera++/profiles/
cp coding_style_epitech.params ~/.vera++/profiles/

vera++ -p coding_style_epitech --parameters ~/.vera++/profiles/coding_style_epitech.params  src/**/*.c include/**/*.c tests/**/*.c
```

In docker
```bash
docker build . -t epitechcontent/epitest-docker:vera
docker run -it --rm \
    -v "$(pwd):/home/epitest/project" \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY=$DISPLAY \
    --device /dev/snd \
    epitechcontent/epitest-docker:vera

$> vera src/**/*.c include/**/*.c tests/**/*.c
```

if you need acces to X11 display don't forget to use `xhost +local:` before launching the docker image.
