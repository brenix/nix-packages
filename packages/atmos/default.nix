{
  lib,
  buildGo124Module,
  fetchFromGitHub,
}:
buildGo124Module rec {
  pname = "atmos";
  version = "1.174.0";

  src = fetchFromGitHub {
    owner = "cloudposse";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-lkU4g+CMT3Dob7dG5iaX82FZ6oWIEkCnL+RrZ+JRmFM=";
  };

  vendorHash = "sha256-0VtuRtvof360vH3SK3TzV4S44owSqn7n2J/aV7/KIJI=";

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
