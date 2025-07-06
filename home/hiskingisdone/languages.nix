{ pkgs, ... }:

{
    home.packages = with pkgs; [
        rocmPackages.llvm.rocm-merged-llvm
        python314
        nodejs_24
        typescript
        go
        lua
        eslint_d
        uv
        python313Packages.ujson
        rustup
    ];
}
