# Debian packaging for LANDrop

The repository provide files to build a Debian package from [LANDrop sources](https://github.com/LANDrop/LANDrop)

## Compile your own package

You could compile your own package easily using provided *Makefile*. Firstly, you need to install dependencies:

```
apt install make wget tar gzip debspawn
```

After, just run `make` command to build your own package. By default, a package for your current Debian suite and architecture will be builded. You also could specify the desire Debian suite and architecture by setting respesctivly the `SUITE` and `ARCH` environment variables. For instance, to build a package for Debian testing i386, run `SUITE=testing ARCH=i386 make`.
