(final: prev: {
  gnome2.GConf = final.emptyDirectory;

  unityhub = prev.unityhub.override {
    extraLibs = unityhubPkgs: let
      lib = prev.lib;
      libxml2-legacy = prev.libxml2.overrideAttrs (previousAttrs: rec {
        version = "2.13.8";
        src = prev.fetchurl {
          url = "mirror://gnome/sources/libxml2/${lib.versions.majorMinor version}/libxml2-${version}.tar.xz";
          hash = "sha256-J3KUyzMRmrcbK8gfL0Rem8lDW4k60VuyzSsOhZoO6Eo=";
        };
      });
    in [
      libxml2-legacy
    ];
  };
})
