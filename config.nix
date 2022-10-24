# ref: https://nixos.org/manual/nixpkgs/stable/#chap-packageconfig
# wiki
# load: nix-env -iA nixpkgs.myPackages
{
  packageOverrides = pkgs: with pkgs; rec {
    myProfile = writeText "my-profile" ''
      export PATH=$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:/sbin:/bin:/usr/sbin:/usr/bin
      export MANPATH=$HOME/.nix-profile/share/man:/nix/var/nix/profiles/default/share/man:/usr/share/man
      export INFOPATH=$HOME/.nix-profile/share/info:/nix/var/nix/profiles/default/share/info:/usr/share/info
    '';
    myPackages = pkgs.buildEnv {
      name = "my-packages";
      paths = [
        (runCommand "profile" {} ''
          mkdir -p $out/etc/profile.d
          cp ${myProfile} $out/etc/profile.d/my-profile.sh
        '')
        hunspell
        sqlite
        aspell
        bc
        coreutils
        ffmpeg
        #man
        nixUnstable
        emscripten
        jq
        nox
        silver-searcher
        neovim
      ];
      pathsToLink = [ "/share/man" "/share/doc" "/bin" "/etc" ]; # only link the paths listed which gets rid of the extra stuff in the profile
      extraOutputsToInstall = [ "man" "doc" ]; # getting documentation
      # run after building the environment
      postBuild = ''
       if [ -x $out/bin/install-info -a -w $out/share/info ]; then
          shopt -s nullglob
          for i in $out/share/info/*.info $out/share/info/*.info.gz; do
              $out/bin/install-info $i $out/share/info/dir
          done
        fi
      '';
    };
  };
}
