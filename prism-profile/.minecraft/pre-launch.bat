@echo off
set inst_java=%1
set inst_mc_dir=%2
shift
shift

%inst_java% -jar "%inst_mc_dir%/bootstrap.jar" "https://raw.githubusercontent.com/josef-dijon/lunarkraft/main/bootstrap_manifest.json" "%inst_mc_dir%"
%inst_java% -jar "%inst_mc_dir%/mod-updater.jar" "https://raw.githubusercontent.com/josef-dijon/lunarkraft/main/mod_manifest.json" "%inst_mc_dir%"