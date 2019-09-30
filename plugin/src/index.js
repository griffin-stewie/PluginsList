var AUTHOR_URL_STRING = "https://griffin-stewie.github.io/";

/**
 * Handles startup action.
 */
function onStartup(context) {
    if (!isFrameworkLoaded()) {
        var contentsPath = context.scriptPath.stringByDeletingLastPathComponent().stringByDeletingLastPathComponent();
        var resourcesPath = contentsPath.stringByAppendingPathComponent("Resources");

        var result = Mocha.sharedRuntime().loadFrameworkWithName_inDirectory("PluginsList", resourcesPath);
        log("PluginsList Framework loaded");
        if (!result) {
            var alert = NSAlert.alloc().init();
            alert.alertStyle = NSAlertStyleCritical;
            alert.messageText = "Loading framework for “PluginsList” failed"
            alert.informativeText = "Please try disabling and enabling the plugin or restarting Sketch."

            alert.runModal();

            return;
        }
    }

    log(`PluginsListPluginController ${context.plugin.version()} Enabled`);
    PluginsListPluginController.sharedController().enabled = true;
}

/**
 * Handles shutdown action.
 */
function onShutdown(context) {
    if (isFrameworkLoaded()) {
        log(`PluginsListPluginController ${context.plugin.version()} Disabled`);
        PluginsListPluginController.sharedController().enabled = false;
    }
}

/**
 *
 */
function exportPluginsList(context) {
    if (isFrameworkLoaded()) {
        PluginsListPluginController.sharedController().setPluginCommnad(context.command);
        PluginsListPluginController.sharedController().document = context.document;
        PluginsListPluginController.sharedController().exportPluginsList();
        log(`PluginsListPluginController context: ${context}`);
    }
}

function isFrameworkLoaded() {
    return Boolean(NSClassFromString("PluginsListPluginController"));
}

/**
 * Handles about menu item.
 */
function onSelectAboutMenuItem(context) {
    var repositoryUrl = NSURL.URLWithString(AUTHOR_URL_STRING);

    NSWorkspace.sharedWorkspace().openURL(repositoryUrl);
}