# Gmail Safe Note

Gmail can block zip files that contain scripts such as `.ps1`.

To send this template by email:

1. Use `Universal-Agent-Template-Gmail-Safe.zip`.
2. In that version, PowerShell scripts are renamed from `.ps1` to `.ps1.txt`.
3. After download, rename these files only if the scripts must be executed:

```text
install-template.ps1.txt -> install-template.ps1
.agent/scripts/agent-doctor.ps1.txt -> .agent/scripts/agent-doctor.ps1
```

The template still works without running the scripts.
The scripts only help install the files faster and verify the configuration.

