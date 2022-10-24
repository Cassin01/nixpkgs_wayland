nixpkgs

## Note about the specific file
## `configuration.nix`
`configuration.nix` <- `--assume-unchanged`
- unlock: `git update-index --no-asuume-unchanged`
- lock: `git update-index --asuume-unchanged`

### How to check if weather if the file is locked

`git ls-files -v`
