import sketch from 'sketch'
import mustache from "mustache";
import fs from '@skpm/fs';
import * as ui from './UI';
// documentation: https://developer.sketchapp.com/reference/api/

export function exportAsMarkdownTable(context) {
  const templateURL = context.plugin.urlForResourceNamed("Templates/markdown_table.mustache")
  const option = {
    "isClipboardAvailable": true,
    "mustacheTemplateFileURL": templateURL,
    "defaultFileName": "plugin_informations.md",
    "escapeFunction": (text) => {
      return String(text).replaceAll('|', '\\|')
    }
  }
  exportAs(context, option);
}

export function exportAsCSV(context) {
  const templateURL = context.plugin.urlForResourceNamed("Templates/csv.mustache");
  const option = {
    "isClipboardAvailable": true,
    "mustacheTemplateFileURL": templateURL,
    "defaultFileName": "plugin_informations.csv",
    "escapeFunction": (text) => {
      return String(text).replaceAll('"', '""')
    }
  }
  exportAs(context, option);
}

export function exportAsBacklogTable(context) {
  const templateURL = context.plugin.urlForResourceNamed("Templates/backlog_table.mustache");
  const option = {
    "isClipboardAvailable": true,
    "mustacheTemplateFileURL": templateURL,
    "defaultFileName": "plugin_informations.txt",
    "escapeFunction": (text) => {
      return String(text).replaceAll('|', '\\\\|')
    }
  }
  exportAs(context, option);
}

export function exportUsingCustomTemplate(context) {
  const fileURL = ui.showSelectFileDialog();
  if (fileURL === null || fileURL === undefined) {
    return ;
  }

  const option = {
    "isClipboardAvailable": true,
    "mustacheTemplateFileURL": fileURL.URLByStandardizingPath(),
    "defaultFileName": "plugin_informations.txt"
  }
  exportAs(context, option);
}

/* ---------------- */

function exportAs(context,option) {
  const responseCode = ui.exportAlert({
    "isClipboardAvailable": option.isClipboardAvailable,
    "alertIcon": alertIcon(context)
  }).runModal();

  if (responseCode === ui.CancelButtonTag) {
    return ;
  }

  const manager = AppController.sharedInstance().pluginManager();
  const templateURL = option.mustacheTemplateFileURL;
  const template = fs.readFileSync(templateURL.path())
  const plugins = manager.enabledPlugins()
  const mappedPlugins = Array.from(plugins).map(plugin => {
    return {
      "name": plugin.name(),
      "version": plugin.version(),
      "homepageURL": plugin.homepageURL(),
      "author": plugin.author()
    }
  })

  mappedPlugins.sort((a, b) => a.name > b.name)

  if (option.escapeFunction === undefined || option.escapeFunction === null) {
  } else {
    mustache.escape = option.escapeFunction;
  }

  const rendered = mustache.render(`${template}`, {
    "plugins": mappedPlugins
  });

  log(rendered)

  switch (responseCode) {
    case ui.SaveToFileButtonTag:
      const destinationURL = ui.showSaveFileDialog(option.defaultFileName)
      if (destinationURL === null) {
        return
      }
      const path = destinationURL.path()
      const fileString = NSString.stringWithString(rendered)
      fileString.writeToFile_atomically_encoding_error(
        path,
        true,
        NSUTF8StringEncoding,
        null
      )
      break;
    case ui.CopyButtonTag:
      const pasteboard = NSPasteboard.generalPasteboard()
      pasteboard.declareTypes_owner([NSPasteboardTypeString], null);
      pasteboard.setString_forType(rendered, NSPasteboardTypeString);
      sketch.UI.message("Copied")
      break;
    default:
      break;
  }
}

function alertIcon(context) {
  const __command = context.command;
  if (__command.pluginBundle() && __command.pluginBundle().alertIcon()) {
    return __command.pluginBundle().alertIcon()
  }

  return null;
}