panels().forEach(panel => {
  panel.widgets("org.kde.plasma.kickoff").forEach(launcher => {
    launcher.currentConfigGroup = ["General"];
    launcher.writeConfig("icon", "atomic-blueberry-symbolic");
  });
});
