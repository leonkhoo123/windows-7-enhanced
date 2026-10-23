var plasma = getApiVersion(1);

var layout = {
    "desktops": [
        {
            "applets": [
            ],
            "config": {
                "/": {
                    "ItemGeometries-1862x1164": "",
                    "ItemGeometries-2560x1440": "",
                    "ItemGeometriesHorizontal": "",
                    "formfactor": "0",
                    "immutability": "1",
                    "lastScreen": "0",
                    "wallpaperplugin": "org.kde.image"
                },
                "/ConfigDialog": {
                    "DialogHeight": "630",
                    "DialogWidth": "810"
                },
                "/General": {
                    "changedPositions": "{\"desktop:/asomethingbackup.sh\":[\"2560x1440\",\"3\",\"15\"]}",
                    "lastResolution": "2560x1440",
                    "positions": "{\"2560x1440\":[\"1\",\"23\",\"desktop:/chrome-bbdeiblfgdokhlblpgeaokenkfknecgl-Default.desktop\",\"0\",\"0\",\"desktop:/chrome-gdfaincndogidkdcdkhapmbffkckdkhn-Default.desktop\",\"0\",\"1\",\"desktop:/chrome-hnpfjngllnobngcgfapefoaidbinmjnm-Default.desktop\",\"0\",\"0\",\"desktop:/chrome-hmjcdonmhijmnefklekckjkeoknbiipb-Default.desktop\",\"0\",\"2\",\"desktop:/asomethingbackup.sh\",\"3\",\"15\",\"desktop:/chrome-cinhimbnkkaeohfgghhklpknlkffjgod-Default.desktop\",\"0\",\"0\"]}",
                    "sortMode": "-1"
                },
                "/Wallpaper/org.kde.image/General": {
                    "Image": "file:///usr/share/wallpapers/Elarun/",
                    "SlidePaths": "/usr/share/wallpapers/"
                }
            },
            "wallpaperPlugin": "org.kde.image"
        },
        {
            "applets": [
            ],
            "config": {
                "/": {
                    "formfactor": "0",
                    "immutability": "1",
                    "lastScreen": "1",
                    "wallpaperplugin": "org.kde.image"
                },
                "/Wallpaper/org.kde.image/General": {
                    "Image": "file:///usr/share/wallpapers/Elarun/",
                    "SlidePaths": "/usr/share/wallpapers/"
                }
            },
            "wallpaperPlugin": "org.kde.image"
        }
    ],
    "panels": [
        {
            "alignment": "center",
            "applets": [
                {
                    "config": {
                        "/": {
                            "popupHeight": "868",
                            "popupWidth": "637"
                        },
                        "/ConfigDialog": {
                            "DialogHeight": "630",
                            "DialogWidth": "810"
                        },
                        "/General": {
                            "alphaSort": "true",
                            "compactMode": "true",
                            "favoritesPortedToKAstats": "true",
                            "paneSwap": "true",
                            "switchCategoryOnHover": "true",
                            "systemFavorites": "suspend\\,hibernate\\,reboot\\,shutdown"
                        }
                    },
                    "plugin": "org.kde.plasma.kickoff"
                },
                {
                    "config": {
                    },
                    "plugin": "org.kde.plasma.marginsseparator"
                },
                {
                    "config": {
                        "/": {
                            "popupHeight": "400",
                            "popupWidth": "560"
                        },
                        "/ConfigDialog": {
                            "DialogHeight": "630",
                            "DialogWidth": "810"
                        },
                        "/General": {
                            "groupingStrategy": "0",
                            "indicateAudioStreams": "false",
                            "launchers": "applications:org.kde.plasma-systemmonitor.desktop,preferred://filemanager,applications:com.valvesoftware.Steam.desktop,applications:chrome-cinhimbnkkaeohfgghhklpknlkffjgod-Default.desktop,file:///var/lib/flatpak/exports/share/applications/com.discordapp.Discord.desktop,applications:chrome-hmjcdonmhijmnefklekckjkeoknbiipb-Default.desktop,applications:chrome-gdfaincndogidkdcdkhapmbffkckdkhn-Default.desktop,applications:chrome-bbdeiblfgdokhlblpgeaokenkfknecgl-Default.desktop,applications:chrome-hnpfjngllnobngcgfapefoaidbinmjnm-Default.desktop,preferred://browser,applications:sourcegit.desktop,applications:code.desktop",
                            "separateLaunchers": "false",
                            "taskMaxWidth": "Narrow",
                            "tooltipControls": "false"
                        }
                    },
                    "plugin": "org.kde.plasma.taskmanager"
                },
                {
                    "config": {
                        "/ConfigDialog": {
                            "DialogHeight": "630",
                            "DialogWidth": "810"
                        }
                    },
                    "plugin": "org.kde.plasma.marginsseparator"
                },
                {
                    "config": {
                    },
                    "plugin": "org.kde.plasma.systemtray"
                },
                {
                    "config": {
                        "/": {
                            "popupHeight": "459",
                            "popupWidth": "810"
                        },
                        "/Appearance": {
                            "autoFontAndSize": "false",
                            "dateDisplayFormat": "BesideTime",
                            "enabledCalendarPlugins": "alternatecalendar",
                            "fontFamily": "Inter",
                            "fontWeight": "400"
                        },
                        "/ConfigDialog": {
                            "DialogHeight": "630",
                            "DialogWidth": "810"
                        }
                    },
                    "plugin": "org.kde.plasma.digitalclock"
                }
            ],
            "config": {
                "/": {
                    "formfactor": "2",
                    "immutability": "1",
                    "lastScreen": "0",
                    "wallpaperplugin": "org.kde.image"
                }
            },
            "height": 2.125,
            "hiding": "normal",
            "lengthMode": "fill",
            "location": "bottom",
            "maximumLength": 160,
            "minimumLength": 160,
            "offset": 0,
            "opacity": "translucent"
        }
    ],
    "serializationFormatVersion": "1"
}
;

plasma.loadSerializedLayout(layout);
