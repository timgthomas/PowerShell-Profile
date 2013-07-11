PowerShell-Profile
==================

When cloning this repository, be sure to specify the `recursive` flag:

    git clone --recursive git://github.com/TimGThomas/PowerShell-Profile

To add the profile to a PowerShell instance, first set the execution policy:

    Set-ExecutionPolicy Unrestricted
    
Then, if you don't already have a profile set up:

    New-Item $profile -type file -force

Add the following line:

    . {{clone-dir}}\profile.ps1
