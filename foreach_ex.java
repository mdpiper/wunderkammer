// Clear any user-owned labels from list. Locate first, then remove.
List<String> toRemove = new ArrayList<String>();
for (Map.Entry<String, LabelJSO> entry : data.modelLabels.entrySet()) {
  if (data.security.getWmtUsername().equals(entry.getValue().getOwner())) {
    toRemove.add(entry.getKey());
  }
}
for (String key : toRemove) {
  GWT.log("Remove label: " + key);
  data.modelLabels.remove(key);
}
