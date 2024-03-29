# Lunarkraft

Lunarkraft modpack for Minecraft using Prism Launcher.

## LunarKraft Prism Launcher Guide

Prism Launcher is yet another Minecraft launcher, similar to the Curseforge launcher. Prism allows more flexibility in managing Minecraft instances, and managing keeping the client mod list up to date with the server. In the background, prism runs a [simple java program](https://github.com/josef-dijon/minecraft-mod-updater) to check that your mods are up to date each time you launch the Lunarkraft instance of minecraft.

Instances are completely separate from any version of Minecraft you already have installed, so the LunarKraft mods wont interfer with any other mod packs or servers you play on.

I've been using Prism Launcher for LunarKraft for several months now, and it is reliable, and far less bloatware-y than CurseForge/Overwolf.

## Setting up the Launcher

1. Download and install the [Prism Launcher](https://prismlauncher.org/download/).
2. Download the [Lunarkraft profile](https://github.com/josef-dijon/lunarkraft/releases/latest).
3. Once the launcher is installed, run it and click "Add Instance".
![Add instance](https://github.com/josef-dijon/lunarkraft/blob/main/doc/screenshots/image3.png?raw=true)
4. Select the "Import from zip" option, browse to the zip file and then click OK.
![Importing the instance zip](https://github.com/josef-dijon/lunarkraft/blob/main/doc/screenshots/image2.png?raw=true)
5. Double click the new instance or select "Launch" on the right.
![Launch Minecraft](https://github.com/josef-dijon/lunarkraft/blob/main/doc/screenshots/image4.png?raw=true)
6. You'll be prompted to sign in if you haven't already. Click yes, and then "Add Microsoft". You'll be redirected to a Microsoft login page, just follow the prompts.
![No accounts dialogue](https://github.com/josef-dijon/lunarkraft/blob/main/doc/screenshots/image6.png?raw=true)
![Adding Microsoft account](https://github.com/josef-dijon/lunarkraft/blob/main/doc/screenshots/image1.png?raw=true)
![Microsoft sign in successful](https://github.com/josef-dijon/lunarkraft/blob/main/doc/screenshots/image5.png?raw=true)
7. And that's it! Prism Launcher will download Minecraft, install the Fabric loader, and download all the mods, resource packs and shaders for the server. Once you're in, the LunarKraft server link will already be set up in the multiplayer screen on Minecraft. Note, the download takes a little bit, so be patient. And watch the log for any red text.

## How it works

The prism launcher profile runs a java program that downloads the mod updater. It then runs the mod updater, which downloads a manifest from this github repo, and downloads (or removes) all mods to keep your Minecraft instance in sync with the manifest. Any mods that are updated or new mods that are added to the manifest will be automatically downloaded when you run minecraft. Any mods that have been removed from the manifest, e.g. ones that have been found to be buggy or unreliable will be deleted from the mods directory. Note that only mods that are explicitly deprecated in the manifest are actually deleted, this will prevent any client side mods outside the manifest from being removed unintentionally.

## Assistance

If you have questions, or need help with anything, hit up the Discord server:
[Lunarkraft Discord](https://discord.com/channels/851400460242124821/851400460816089090)

The mod updater software source is here:
[Minecraft Mod Updater](https://github.com/josef-dijon/minecraft-mod-updater)
