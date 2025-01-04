{
  config,
  pkgs,
  lib,
  ...
}: {
  hardware.graphics.enable = true;

  services.xserver.videoDrivers = ["nvidia" "modesetting"];

  boot.blacklistedKernelModules = ["nouveau"];

  hardware.amdgpu.initrd.enable = lib.mkDefault true;

  hardware.nvidia = {
    modesetting.enable = true;

    powerManagement.enable = true;
    powerManagement.finegrained = true;

    open = false;

    nvidiaSettings = true;

    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      amdgpuBusId = "PCI:5:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  environment.variables = {
    __EGL_VENDOR_LIBRARY_FILENAMES = "${pkgs.mesa.drivers.outPath}/share/glvnd/egl_vendor.d/50_mesa.json";
  };
}
