{
    mySettings,
    ...
}: let
    conf = "app-rofi";
    src = "src";
    dir = "rofi";
in {
    home.activation.${conf} = ''
        rm -rf ${mySettings.configDir}/${dir}

        echo ""
        echo "******* ⏳ start copy ${dir}"

        cp -r ${mySettings.userDir}/apps/${conf}/${src} \
              ${mySettings.configDir}/${dir}

        echo "******* 🥳 end in this path ${mySettings.configDir}/${dir}"
        echo ""
    '';
}
