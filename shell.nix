with import <nixpkgs> {};
with pkgs.python3Packages;


buildPythonPackage rec {
pyproject = true;
  name = "eveauth";
  src = ./python-eveauth/src/eveauth/__init__.py;
  buildsytem = [setuptools];
  propagatedBuildInputs = [ pytest numpy pkgs.libsndfile ];
}

