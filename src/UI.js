export const SaveToFileButtonTag = 1000;
export const CopyButtonTag = 1001;
export const CancelButtonTag = 1002;

export function showSaveFileDialog(defaultFileName) {
  const savePanel = NSSavePanel.savePanel()
  savePanel.setNameFieldStringValue(defaultFileName)
  savePanel.setAllowsOtherFileTypes(true)
  savePanel.setExtensionHidden(false)

  if (savePanel.runModal()) {
    return savePanel.URL()
  }

  return null
}

export function showSelectFileDialog(params) {
  const panel = NSOpenPanel.openPanel()
  panel.prompt = "Template"
  panel.message = "Select your custom template"
  panel.canChooseFiles = true
  panel.canChooseDirectories = false
  panel.allowsMultipleSelection = false
  panel.canCreateDirectories = false

  if (panel.runModal()) {
    return panel.URL()
  }

  return null
}

export function showSaveDirectoryDialog(params) {
  const panel = NSOpenPanel.openPanel()
  panel.prompt = "Export"
  panel.message = "Choose export directory"
  panel.canChooseFiles = false
  panel.canChooseDirectories = true
  panel.allowsMultipleSelection = false
  panel.canCreateDirectories = true

  if (panel.runModal()) {
    return panel.URL()
  }

  return null
}

export function exportAlert(options) {
  const alert = NSAlert.alloc().init()
  alert.setMessageText("Export Plugin Informations")
  alert.icon = options.alertIcon
  alert.addButtonWithTitle("Save to file...");

  const copyButton = alert.addButtonWithTitle("Copy to pasteboard");
  copyButton.setEnabled(options.isClipboardAvailable);
  copyButton.tag = CopyButtonTag;
  alert.addButtonWithTitle("Cancel");

  return alert;
}