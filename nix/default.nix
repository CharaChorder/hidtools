{
  lib,
  buildDotnetModule,
  dotnetCorePackages,
  fetchurl,
}:
buildDotnetModule {
  pname = "waratah";
  version = "1.90";

  src = ../.;

  HID_SPECIFICATION = fetchurl {
    url = "https://www.usb.org/sites/default/files/hut1_7.pdf";
    hash = "sha256-Zehb2MsUan7lyQW/WrChKm1pJdHIZrrWCady+9/rjfU=";
  };

  projectFile = "Waratah/WaratahCmd/WaratahCmd.csproj";
  nugetDeps = ./deps.json;

  dotnet-sdk = dotnetCorePackages.sdk_8_0;
  dotnet-runtime = dotnetCorePackages.runtime_8_0;

  meta = with lib; {
    homepage = "https://github.com/microsoft/hidtools";
    description = "Waratah is a HID descriptor composition tool. It offers a high-level of abstraction, eliminates common errors (by design), and optimizes the descriptor to reduce byte size.";
    license = licenses.mit;
    mainProgram = "WaratahCmd";
  };
}
