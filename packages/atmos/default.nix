{
  lib,
  buildGo124Module,
  fetchFromGitHub,
}:
buildGo124Module rec {
  pname = "atmos";
  version = "1.170.0";

  src = fetchFromGitHub {
    owner = "cloudposse";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-yCTi5/N37FDBUP4IqtSSFSaEsXMNrR+uQRVGB92GaLA=";
  };

  vendorHash = "sha256-5gztFFZd0L5Zgc7whw44d14eXLIbvILXQFEj6AHaVfI=";

  ldflags = [
    "-s"
    "-w"
    "-X github.com/cloudposse/atmos/cmd.Version=v${version}"
  ];

  doCheck = false;
  doInstallCheck = false;

  meta = with lib; {
    homepage = "https://atmos.tools";
    changelog = "https://github.com/cloudposse/atmos/releases/tag/v${version}";
    description = "Universal Tool for DevOps and Cloud Automation (works with terraform, helm, helmfile, etc)";
    mainProgram = "atmos";
    license = licenses.asl20;
  };
}
