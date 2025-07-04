# TODO: remove in the future
# fix missing 2to3 command for newer python versions
# gconf is needed for unityhub
(final: prev: {
  gnome2.GConf = prev.gnome2.GConf.override {
    python3 = prev.python312;
  };
})
