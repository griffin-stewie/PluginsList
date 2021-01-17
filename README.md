# PluginsList

This [Sketch](https://www.sketchapp.com/) plugin gives you exporting plugins informations as text.

Easy to share plugin informations that you use to your team.

## Supported format

- CSV
- Markdown Table
- [Backlog](https://backlog.com) Table
- [Your custom template](https://github.com/griffin-stewie/PluginsList#customizing-template)

## Install

- Downloads latest plugin from [here](https://github.com/griffin-stewie/PluginsList/releases/latest).
- Unzip it, and doble click `PluginsList.sketchplugin`

## How it works

1. Open menu `Plugins > Plugins List`
1. Select text format
1. Choose `Copy to pasteboard` or `Save to file...`

## Customizing template

You can provide your custom template. The plugin uses [Mustache template](https://mustache.github.io/) engines. When you write your template file, run

1. Open menu `Plugins > Plugins List`
1. Click `Export using custom template`
1. Select your custom template file.
1. Choose `Copy to pasteboard` or `Save to file...`

Here is the mustache template spec links bellow.

- [mustache\(5\) \- Logic\-less templates\.](https://mustache.github.io/mustache.5.html)
- [janl/mustache\.js: Minimal templating with \{\{mustaches\}\} in JavaScript](https://github.com/janl/mustache.js)

Bultin templates are [here](assets/Templates) as examples.

### Available Values

| Key | Type | Description |
|-----|------|-------------|
| appcastURL | String | A URL to the plugin’s appcast file containing information about the available versions, including URLs to download specific versions. Sketch automatically checks this file for updates and notifies the user when there’s an update available. |
| author | String | Provides the name of the plugin author. |
| authorEmail | String | Specifies how to contact the plugin author by email. This is optional. |
| compatibleVersion | String | Defines the minimum version of Sketch required to run the plugin. This string must be provided using semantic versioning. |
| enabled | Number(0/1) | `1` when the plugin is enabled |
| homepageURL | String | Specifies a website address where users can find more information or provide feedback for the plugin. This is optional. |
| identifier | String | Defines a unique identifier for the plugin. This value is a string using reverse-domain syntax. |
| maximumCompatibleVersion | String | Defines the maximum version of Sketch supported by the plugin. This string is optional and must be using semantic versioning if provided. |
| name | String | Provides a human-readable name for the plugin when displayed to the user, e.g. within the Plugins menu or the list of installed plugins in the Sketch preferences. |
| pluginDescription | String | Provides a general description of what the plugin does. |
| suppliesData | Number(0/1) | Specifies if the plugin is a data supplier. If set to true a visual indicator is displayed with the plugin within the preference pane showing the list of all installed plugins. |
| url | String | File URL where the plugin is located in your machine. |
| version | String | The version of the plugin using semantic versioning. |

See also [Sketch Developer — Manifest](https://developer.sketch.com/plugins/plugin-manifest)

## Credits

- [griffin-stewie](https://griffin-stewie.github.io/): Developer
- [Poem](https://dribbble.com/poem_f): Icon Designer
