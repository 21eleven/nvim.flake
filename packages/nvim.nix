{ pkgs }:

let 
    # customRC is a special attribute name that exists on the neovim nix package
    # here we override it
    customRC = import ../config { inherit pkgs; };
    plugins = import ../plugins.nix { inherit pkgs; };
    runtimeDeps = pkgs.symlinkJoin {
        name = "neovim runtime deps";
        paths = import ../runtimeDeps.nix { inherit pkgs; };
        # see: https://ertt.ca/blog/2022/01-12-nix-symlinkJoin-nodePackages/
        postBuild = ''
            for f in $out/lib/node_modules/.bin/*; do
               path="$(readlink --canonicalize-missing "$f")"
               ln -s "$path" "$out/bin/$(basename $f)"
            done
        '';
    };
    customNvim = pkgs.wrapNeovim pkgs.neovim {
        configure = {
            inherit customRC;
            packages.all.start = plugins;
        };
    };
in pkgs.writeShellApplication {
    name = "nvim";
    runtimeInputs = [ runtimeDeps ];
    text = ''
        ${customNvim}/bin/nvim "$@"
    '';
}
