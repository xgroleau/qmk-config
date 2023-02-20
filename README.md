# Qmk-configs
My qmk configuration. Uses [nix](https://nixos.org/) to build and flash the firmware.

The configurations are generated by [qmk online tool](https://config.qmk.fm).

## Flash
To flash, simply run `nix run .#$KEYBAORD` where `$KEYBOARD` is the desired keyboard.
Or you can manually use qmk command line if you use `nix develop`.

## Keyboards
The following keyboards are supported.
- [sol3](https://www.rgbkb.net/collections/sol-3)
