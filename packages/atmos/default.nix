{
  lib,
  buildGo124Module,
  fetchFromGitHub,
}:
buildGo124Module rec {
  pname = "atmos";
  version = "1.180.0";

  src = fetchFromGitHub {
    owner = "cloudposse";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-/yCgC73J4PVTqmJBW0eLCMVWtsyMGLeF0Rmvx+N/oP8=";
  };

  vendorHash = "sha256-k1zC3tUF2uDAo86J6dZmYOGZcYFBNdSH15cyX2tiZEg=";

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
